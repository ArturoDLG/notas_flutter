import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/enums.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../routes/routes.dart';
import '../views/controller/sign_in_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Provider.of(context);
    if (controller.fetching) {
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

    controller.onFetchingChanged(true);

    final result = await context.read<AuthenticationRepository>().singIn(
          controller.username,
          controller.password,
        );

    if (!controller.mounted) {
      return;
    }
    result.when(
      (failure) {
        controller.onFetchingChanged(false);

        final message = switch (failure) {
          SingInFailure.notFound => 'Not Found',
          SingInFailure.unauthorized => 'Invalid Password',
          SingInFailure.unknown => 'Error',
          SingInFailure.network => 'Network error',
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      },
      (user) {
        Navigator.pushReplacementNamed(
          context,
          Routes.home,
        );
      },
    );
  }
}
