import 'package:flutter/material.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkModeEnable = false;

  void _toogleTheme() {
    setState(() {
      _isDarkModeEnable = !_isDarkModeEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isDarkModeEnable: _isDarkModeEnable,
      toogleCallback: _toogleTheme,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: _isDarkModeEnable
            ? ThemeData.dark(
                useMaterial3: true,
              )
            : ThemeData.light(
                useMaterial3: true,
              ),
        home: const MyHomePage(title: 'Sección 11'),
      ),
    );
  }
}

class ThemeProvider extends InheritedWidget {
  final bool isDarkModeEnable;
  final void Function() toogleCallback;

  const ThemeProvider({
    Key? key,
    required this.isDarkModeEnable,
    required this.toogleCallback,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return oldWidget.isDarkModeEnable != isDarkModeEnable;
  }

  static ThemeProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();

    assert(provider != null, "Could not fin a ThemeProvider");

    return provider!;
  }
}
