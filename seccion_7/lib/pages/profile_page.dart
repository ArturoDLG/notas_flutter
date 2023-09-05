//Seccion 7
//lecciones:
//147: popUntil
//152: pushNamedAndRemoveUntil
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_7/routes.dart';

/*
Cuando queremos eliminar las rutas del historial y conservar solamente aquella 
que nos interesa, Navigator.popUntil nos permite hacer esto, mediante un 
callback que retorna true cuando dicha condicion se cumpla.

Si queremos hacer esto mismo pero con rutas, debemos de usar el metodo 
Navigator.pushNamedAndRemoveUntil, el cual funciona similar a popUntil con la 
diferencia que la page que queremos insertar la colocamos de parametro.
*/

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: Center(
        child: MaterialButton(
          child: const Text(
            'Log Out',
          ),
          onPressed: () {
            //Eliminamos las rutas hasta encontrar una que cumpla la condicion
            // Navigator.popUntil(
            //   context,
            //   (route) {
            //     final name = route.settings.name;
            //     print('✖️ $name');
            //     return name == Routes.initialRoute;
            //   },
            // );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.initialRoute,
              (route) => false, // eliminamos todas las rutas del historial
            );
          },
        ),
      ),
    );
  }
}
