import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class ColorsScaffold extends StatefulWidget {
  const ColorsScaffold({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<ColorsScaffold> createState() => _ColorsScaffoldState();
}

class _ColorsScaffoldState extends State<ColorsScaffold> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = () {
      final location = GoRouter.of(context)
          .routerDelegate
          .currentConfiguration
          .uri
          .toString();
      return switch (location) {
        '/red' => 0,
        '/green' => 1,
        _ => 2,
      };
    }();
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          final router = GoRouter.of(context);
          if (index == selectedIndex && router.canPop()) {
            router.pop();
            return;
          }
          final route = switch (index) {
            0 => Routes.red,
            1 => Routes.green,
            _ => Routes.blue,
          };
          router.goNamed(route);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.red,
            ),
            label: 'Red',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.green,
            ),
            label: 'Green',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.reddit,
              color: Colors.blue,
            ),
            label: 'Blue',
          ),
        ],
      ),
    );
  }
}
