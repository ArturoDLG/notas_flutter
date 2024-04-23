import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../global/session_controller.dart';
import '../my_app.dart';
import '../pages/colors/color_detail_view.dart';
import '../pages/colors/color_view.dart';
import '../pages/colors/widgets/colors_scaffold.dart';
import '../pages/error_view.dart';
import '../pages/home/home_view.dart';
import '../pages/home/product_view.dart';
import '../pages/home/widgets/scaffold.dart';
import '../pages/profile_view.dart';
import '../pages/sign_in_view.dart';
import 'routes.dart';

mixin RouterMixin on State<MyApp> {
  final rootNavigator = GlobalKey<NavigatorState>();
  GoRouter? _router;

  GoRouter get router {
    _router ??= GoRouter(
      initialLocation: '/red',
      navigatorKey: rootNavigator,
      errorBuilder: (_, state) => ErrorView(
        goRouterState: state,
      ),
      routes: [
        ShellRoute(
          builder: (_, __, child) {
            return ColorsScaffold(child: child);
          },
          routes: [
            GoRoute(
              path: '/red',
              name: Routes.red,
              builder: (_, __) => const ColorView(
                color: Colors.red,
                colorName: 'Red',
              ),
              routes: [ColorDetailView.getRoute(Colors.red)],
            ),
            GoRoute(
              path: '/green',
              name: Routes.green,
              builder: (_, __) => const ColorView(
                color: Colors.green,
                colorName: 'Green',
              ),
              routes: [ColorDetailView.getRoute(Colors.green)],
            ),
            GoRoute(
              path: '/blue',
              name: Routes.blue,
              builder: (_, __) => const ColorView(
                color: Colors.blue,
                colorName: 'Blue',
              ),
              routes: [ColorDetailView.getRoute(Colors.blue)],
            ),
          ],
        ),
        ShellRoute(
          builder: (context, state, child) {
            return HomeScaffold(child: child);
          },
          routes: [
            GoRoute(
              name: Routes.home,
              path: '/',
              builder: (_, __) => const HomeView(),
            ),
            GoRoute(
              name: Routes.product,
              path: '/product/:id',
              builder: (_, state) {
                final id = state.pathParameters['id']!;
                return ProductView(
                  id: int.parse(id),
                );
              },
              redirect: (context, state) => authGuard(
                  context: context,
                  state: state,
                  callbackUrl: '/product/${state.pathParameters['id']}'),
            ),
          ],
        ),
        GoRoute(
          name: Routes.profile,
          path: '/profile',
          parentNavigatorKey: rootNavigator,
          builder: (_, __) => const ProfileView(),
          redirect: (context, state) => authGuard(
            context: context,
            state: state,
            callbackUrl: '/profile',
          ),
        ),
        GoRoute(
          name: Routes.signIn,
          path: '/sign-in',
          parentNavigatorKey: rootNavigator,
          builder: (_, state) {
            final callbackURL = state.uri.queryParameters['callbackURL'];
            return SignInView(
              callbackURL: callbackURL ?? '/',
            );
          },
          redirect: (context, state) {
            final isSignedIn = context.read<SessionController>().isSignedIn;
            if (isSignedIn) {
              return '/';
            }
            return null;
          },
        ),
      ],
    );

    return _router!;
  }
}

FutureOr<String?> authGuard({
  required BuildContext context,
  required GoRouterState state,
  required String callbackUrl,
}) {
  final isSignedIn = context.read<SessionController>().isSignedIn;
  if (isSignedIn) {
    return null;
  }
  return '/sign-in?callbackURL=$callbackUrl';
}
