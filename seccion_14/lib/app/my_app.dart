import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'domain/repositories/language_repository.dart';
import 'generated/assets.gen.dart';
import 'generated/translations.g.dart';
import 'presentation/global/controller/theme_controller.dart';
import 'presentation/global/theme.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales?.isNotEmpty ?? false) {
      final locale = locales!.first;
      context.read<LanguageRepository>().setLanguageCode(
            locale.languageCode,
          );
      Intl.defaultLocale = locale.toLanguageTag();
      LocaleSettings.setLocaleRaw(
        locale.languageCode,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = context.watch();
    return GestureDetector(
      child: MaterialApp(
        routes: appRoutes,
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Assets.svgs.error404.svg(),
            ),
          ),
        ),
        initialRoute: Routes.splash,
        theme: getTheme(themeController.darkMode),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocaleUtils.supportedLocales,
        locale: TranslationProvider.of(context).flutterLocale,
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
