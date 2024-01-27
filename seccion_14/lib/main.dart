import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/data/http/http.dart';
import 'app/data/repositories_implementations/account_repository_impl.dart';
import 'app/data/repositories_implementations/authentication_repository_impl.dart';
import 'app/data/repositories_implementations/connectivity_repository_impl.dart';
import 'app/data/repositories_implementations/movies_repository_impl.dart';
import 'app/data/repositories_implementations/preferences_repository_impl.dart';
import 'app/data/repositories_implementations/trending_repository_impl.dart';
import 'app/data/services/local/session_service.dart';
import 'app/data/services/remote/account_api.dart';
import 'app/data/services/remote/authentication_api.dart';
import 'app/data/services/remote/internet_checker.dart';
import 'app/data/services/remote/movies_api.dart';
import 'app/data/services/remote/trending_api.dart';
import 'app/domain/repositories/account_repository.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'app/domain/repositories/connectivity_repository.dart';
import 'app/domain/repositories/movies_repository.dart';
import 'app/domain/repositories/preferences_repository.dart';
import 'app/domain/repositories/trending_repository.dart';
import 'app/my_app.dart';
import 'app/presentation/global/controller/favorites/favorites_controller.dart';
import 'app/presentation/global/controller/favorites/state/favorites_state.dart';
import 'app/presentation/global/controller/session_controller.dart';
import 'app/presentation/global/controller/theme_controller.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final sessionService = SessionService(
    const FlutterSecureStorage(),
  );
  final http = Http(
    baseUrl: 'https://api.themoviedb.org/3',
    apiKey: const String.fromEnvironment('API_KEY'),
    client: Client(),
  );
  final accountApi = AccountApi(
    http,
    sessionService,
  );
  final systemDarkMode =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  final preferences = await SharedPreferences.getInstance();

  final connectivity = ConnectivityRepositoryImpl(
    Connectivity(),
    InternetChecker(),
  );

  await connectivity.initialize();

  runApp(
    MultiProvider(
      providers: [
        Provider<AccountRepository>(
          create: (_) => AccountRepositoryImpl(
            accountApi,
            sessionService,
          ),
        ),
        Provider<PreferencesRepository>(
          create: (_) => PreferencesRepositoryImpl(preferences),
        ),
        Provider<ConnectivityRepository>(
          // Conexión a internet
          create: (_) => connectivity,
        ),
        Provider<AuthenticationRepository>(
          // Inicio de sesion
          create: (_) => AuthenticationRepositoryImpl(
            AuthenticationAPI(http),
            sessionService,
            accountApi,
          ),
        ),
        Provider<TrendingRepository>(
          create: (_) => TrendingRepositoryImpl(
            TrendingApi(http),
          ),
        ),
        Provider<MoviesRepository>(
          create: (_) => MoviesRepositoryImpl(
            MoviesAPI(http),
          ),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (context) {
            final PreferencesRepository preferencesRepository = context.read();
            print(preferencesRepository.darkMode);
            return ThemeController(
              preferencesRepository.darkMode ?? systemDarkMode,
              preferencesRepository: preferencesRepository,
            );
          },
        ),
        ChangeNotifierProvider<SessionController>(
          create: (context) => SessionController(
            authenticationRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<FavoritesController>(
          create: (context) => FavoritesController(
            FavoritesStateLoading(),
            accountRepository: context.read(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
