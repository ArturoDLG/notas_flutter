//Seccion 10
//Lecciones:
//202 - 204.- addPostFrameCallback
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_10/mixins/after_first_layout_mixin.dart';
import 'package:seccion_10/pages/home_page.dart';

/*
Cuando hacemos una implementacion de una pantalla de Splash, la cual carga
datos en segundo plano para poder ejecutar la app, y una vez hecha dicha carga
deseamos pasar a la siguiente pantalla, deberemos de usar la clase 
WidgetsBinding, el cual en su parametro instance, podemos llamar al metodo
addPostFrameCallback, el cual recibe un callback donde podemos hacer uso de
la funcion que queremos llamar cuando la pantalla se haya renderizado al menos
una vez, evitando errores al intentar navegar a la siguiente pantalla o querer
mostrar un dialogo.

Una manera mas sencilla y reutilizable del metodo addPostFrameCallback, es 
mediante el uso de un Mixin (vease after_first_layout_mixin).

Otro uso de addPostFrameCallback es conocer cuando ha terminado de renderizar
una vista, como al usar setState, en este caso podemos llamar al metodo (vease
counter_page.dart), aunque su aplicacion mas comun es la de solamente verificar
que una vista se haya renderizado por primera vez.
*/

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterFirstLayoutMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (timeStamp) {
  //       _init();
  //     },
  //   );
  // }

  @override
  Future<void> onAfterFirtsLayout() async {
    _init();
  }

  Future<void> _init() async {
    // chechar sesion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
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
