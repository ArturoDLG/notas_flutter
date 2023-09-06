//Seccion 7: 51. pushReplacementNamed
//ArturoDLG
import 'package:flutter/material.dart';
import '../routes.dart';

/*
El metodo Navigator.pushReplacementNamed nos permite eliminar la ruta actual del
historial y agregar una nueva en su lugar, para asi no poder regresar a la misma.
Es util para eliminar pages como el splash que nos sirve unicamente para 
indicarle al usuario que hay una carga de datos en proceso al abrir la app.
*/

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => Navigator.pushReplacementNamed(
        context,
        Routes.home,
      ),
      /*
      Nota:
      Podemos utilizar el contexto desde cualquier metodo interno de un 
      StatefulWidget.
      */
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
