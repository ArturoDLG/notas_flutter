import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/failures/sign_in/sign_in_failure.dart';
import '../../../../../generated/translations.g.dart';
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
        child: Text(texts.signIn.signIn),
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
          SignInFailureNotFound() => texts.signIn.errors.submit.notFound,
          SignInFailureUnauthorized() =>
            texts.signIn.errors.submit.unauthorized,
          SignInFailureUnknown() => texts.signIn.errors.submit.unknown,
          SignInFailureNetwork() => texts.signIn.errors.submit.network,
          SignInFailureNotVerified() => texts.signIn.errors.submit.notVerified,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      },
      right: (_) => Navigator.pushReplacementNamed(
        context,
        Routes.home,
      ),
    );
  }
}
