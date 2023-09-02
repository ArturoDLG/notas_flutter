import 'package:device_preview/device_preview.dart';
import 'package:facebook_ui/ui/facebook_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (_) => const MainApp(),
      //habilitar device preview en modo debug
      enabled: !kReleaseMode,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: const FacebookUI(),
    );
  }
}
