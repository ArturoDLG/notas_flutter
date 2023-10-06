import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/repositories/authentication_repository.dart';
import '../../../routes/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                context.read<AuthenticationRepository>().signOut();
                Navigator.pushReplacementNamed(
                  context,
                  Routes.singIn,
                );
              },
              child: const Text('Sing Out'),
            ),
          ],
        ),
      ),
    );
  }
}
