import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/routes.dart';

class ErrorView extends StatelessWidget {
  final GoRouterState goRouterState;
  const ErrorView({
    super.key,
    required this.goRouterState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              goRouterState.error.toString(),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                // GoRouter.of(context).pushReplacementNamed(
                //   Routes.home,
                // );
                GoRouter.of(context).goNamed(Routes.red);
              },
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
