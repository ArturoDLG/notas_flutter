import 'package:flutter/material.dart';
//import 'package:seccion_9/pages/list_page.dart';
import 'package:seccion_9/pages/movable_widget_page.dart';
//import 'package:seccion_9/pages/animated_text.dart';
//import 'package:seccion_9/pages/list_keys_page.dart';
//import 'package:seccion_9/pages/numbers_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovableWidgetPage(),
    );
  }
}
