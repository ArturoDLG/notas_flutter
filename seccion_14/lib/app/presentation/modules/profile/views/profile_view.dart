import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controller/session_controller.dart';
import '../../../global/controller/theme_controller.dart';
import '../../../global/extensions/build_context_ext.dart';
import '../../../routes/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: context.darkMode,
                onChanged: (value) {
                  context.read<ThemeController>().onChanged(value);
                },
              ),
              ListTile(
                title: const Text('Sign out'),
                onTap: () {
                  context.read<SessionController>().signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.singIn,
                    (_) => false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
