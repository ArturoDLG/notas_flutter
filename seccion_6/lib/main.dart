import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';
//import 'pages/timer/timer_page.dart';
//import 'pages/counter/counter_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
