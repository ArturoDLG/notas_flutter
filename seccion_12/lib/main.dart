import 'package:flutter/material.dart';
import 'package:seccion_12/pages/login/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Minimizar el teclado cuando toquemos fuera del TextField
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
