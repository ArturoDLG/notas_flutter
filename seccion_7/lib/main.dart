import 'package:flutter/material.dart';
import 'package:seccion_7/pages/app_routes.dart';

import 'routes.dart';

/*
Para poder navegar entre pantallas, Flutter nosofrece un widget llamado 
Navigator. Navigator usa el contexto (proveido por MaterialApp o CupertinoApp), 
para hacer una busqueda del widget que se solicita en el arbol de widgets.
*/

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //podemos sobreescibir la pagina inicial
      initialRoute: Routes.initialRoute,
      routes: appRoutes,
    );
  }
}
