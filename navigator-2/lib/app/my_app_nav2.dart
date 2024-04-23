// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'pages/home/home_view.dart';
import 'pages/home/product_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final delegate = MyRouterDelegate(
    pages: [
      MyPage(
        path: '/',
        (_) => HomeView(),
      ),
      MyPage(
        path: '/product/:id',
        (data) => ProductView(
          id: int.parse(data['id']!),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: delegate,
      routeInformationParser: MyRouterInformationParser(),
    );
  }
}

class MyPage {
  final String path;
  final Widget Function(Map<String, String> data) builder;
  MyPage(
    this.builder, {
    required this.path,
  });
}

class MyRouterDelegate extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final List<MyPage> pages;
  late List<Page> _navigatorPages;

  MyRouterDelegate({
    required this.pages,
  }) {
    final initalPage = pages.firstWhere(
      (element) => element.path == '/',
    );
    _navigatorPages = [
      MaterialPage(
        name: '/',
        child: initalPage.builder(
          {},
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _navigatorPages,
      onPopPage: (route, result) {
        if (route.didPop(result)) {
          _navigatorPages.removeWhere(
            (element) => element.name == route.settings.name,
          );
          notifyListeners();
          return true;
        }
        return false;
      },
    );
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async {
    final path = configuration.path;
    final data = <String, String>{};

    final index = pages.indexWhere(
      (element) {
        if (element.path == path) {
          return true;
        }

        if (element.path.contains('/:')) {
          final lastIndex = element.path.lastIndexOf('/:');
          final substring = element.path.substring(
            0,
            lastIndex,
          );
          if (path.startsWith(substring)) {
            final key =
                element.path.substring(lastIndex + 2, element.path.length);
            final value = path.substring(lastIndex + 1, path.length);
            data[key] = value;
            return true;
          }
        }

        return false;
      },
    );
    if (index != -1) {
      _navigatorPages = [
        ..._navigatorPages,
        MaterialPage(
          name: path,
          child: pages[index].builder(data),
        ),
      ];
      notifyListeners();
    }
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Uri? get currentConfiguration => Uri.parse(_navigatorPages.last.name ?? '');
}

class MyRouterInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    return Future.value(
      Uri.parse(routeInformation.uri.toString()),
    );
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    return RouteInformation(uri: configuration);
  }
}
