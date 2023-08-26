import 'package:flutter/material.dart';
import 'package:seccion_3/widgets/scaffold_lesson.dart';
//import 'widgets/stack_lesson.dart';
//import 'widgets/flexible_lesson.dart';
//import 'widgets/row_lesson.dart';
//import 'widgets/column_lesson.dart';
//import 'widgets/container_lesson.dart';
//import 'widgets/text_lesson.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldLesson(),
    );
  }
}
