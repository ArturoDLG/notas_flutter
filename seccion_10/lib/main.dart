import 'package:flutter/material.dart';
import 'package:seccion_10/pages/counter_page.dart';
// import 'package:seccion_10/pages/home_page.dart';
// import 'package:seccion_10/pages/product_page.dart';
// import 'package:seccion_10/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}
