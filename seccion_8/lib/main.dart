import 'package:flutter/material.dart';
import 'package:seccion_8/pages/app_routes.dart';
import 'package:seccion_8/utils/app_theme.dart';
import 'package:seccion_8/utils/material_color_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Ocultar teclado al presionar fuera de un textfield dentro de la app
        final focus = FocusScope.of(context);
        final focusChild = focus.focusedChild;
        if (focusChild != null && !focusChild.hasPrimaryFocus) {
          focusChild.unfocus();
        }
      },
      child: MaterialApp(
        routes: appRoutes,
        home: const HomePage(),
        theme: getThemeData(context),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = appRoutes.keys.toList();
    return Scaffold(
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (_, index) {
          final routeName = keys[index];
          return ListTile(
            title: Text(routeName),
            onTap: () => Navigator.pushNamed(
              context,
              routeName,
            ),
          );
        },
      ),
    );
  }
}
