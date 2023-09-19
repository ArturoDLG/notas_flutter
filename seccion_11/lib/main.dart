import 'package:flutter/material.dart';
import 'package:seccion_11/global/theme_controller.dart';
import 'package:seccion_11/pages/my_home_page_provider.dart';
//import 'package:seccion_11/pages/my_home_page.dart';
import 'package:seccion_11/state_management/consumer.dart';
import 'package:seccion_11/state_management/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ThemeController>(
      create: () => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (_, controller) => MaterialApp(
          home: const MyHomePage(),
          theme: controller.isDarkModeEnable
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
        ),
      ),
    );
  }
}
