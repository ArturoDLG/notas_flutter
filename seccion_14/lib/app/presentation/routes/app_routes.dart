import 'package:flutter/material.dart';

import '../modules/favorites/views/favorites_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/offline/offline_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

/// Getter que provee todas las rutas existentes en la app
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.singIn: (context) => const SignInView(),
    Routes.home: (context) => const HomeView(),
    Routes.offline: (context) => const OffilineView(),
    Routes.favorites: (context) => const FavoritesView(),
    Routes.profile: (context) => const ProfileView(),
  };
}
