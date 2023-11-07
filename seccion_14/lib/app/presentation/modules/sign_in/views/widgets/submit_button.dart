import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/failures/sign_in/sign_in_failure.dart';
import '../../../../global/controller/favorites/favorites_controller.dart';
import '../../../../global/controller/session_controller.dart';
import '../../../../routes/routes.dart';
import '../../controller/sign_in_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Provider.of(context);
    if (controller.state.fetching) {
      return const CircularProgressIndicator();
    } else {
      return MaterialButton(
        color: Colors.blue,
        child: const Text('Sing In'),
        onPressed: () {
          final isValid = Form.of(context).validate();
          if (isValid) {
            _submit(context);
          }
        },
      );
    }
  }

  Future<void> _submit(BuildContext context) async {
    final SignInController controller = context.read();

    final result = await controller.submit();

    if (!controller.mounted) {
      return;
    }

    result.when(
      left: (failure) {
        final message = switch (failure) {
          SignInFailureNotFound() => 'Not Found',
          SignInFailureUnauthorized() => 'Invalid User or Password',
          SignInFailureUnknown() => 'Error',
          SignInFailureNetwork() => 'Network error',
          SignInFailureNotVerified() => 'Email not verified',
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      },
      right: (user) {
        final SessionController sessionController = context.read();
        final FavoritesController favoritesController = context.read();
        sessionController.setUser(user);
        favoritesController.init();
        Navigator.pushReplacementNamed(
          context,
          Routes.home,
        );
      },
    );
  }
}
