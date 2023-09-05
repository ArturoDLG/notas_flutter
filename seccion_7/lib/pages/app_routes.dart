//Seccion 7
//lecciones:
//149: Navegando usando nombres de rutas
//150: Pasar datos con nombres de rutas
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_7/pages/color_picker.dart';
import 'package:seccion_7/pages/dialogs_page.dart';
import 'package:seccion_7/pages/splash_page.dart';
import '../routes.dart';
import 'menu_page.dart';
import 'counter_page.dart';
import 'login_page.dart';
/*
Flutter nos permite nombrar nuestras pages para navegar entre ellas usando 
Navigator, para esto creamos un Map que retorne el nombre de la ruta y un Widget
Function que retorne la page a la que queremos navegar. Este Map deberá ser 
puesto en el parametro routes de nuestro MaterialApp.

Por defecto, MaterialApp define a home con la ruta '/', pero se recomienda usar 
un nombre alterno para nuestro home para evitar conflictos.

Para navegar usando los nombres de ruta, usaremos los metodos de Navigator que 
terminen con el sufijo -Named.

Para pasar datos entre paginas, solamente es posible a traves del parametro 
arguments, dentro de este archivo se a creado una funcion que permite recuperar
dicho datos para trabajar con el de la manera mas segura posible.
*/

T getArguments<T>(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as T;

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.home: (_) => const MenuPage(),
      Routes.splash: (_) => const SplashPage(),
      Routes.counter: (_) => const CounterPage(),
      Routes.login: (context) {
        final email = getArguments<String>(context);
        return LoginPage(
          email: email,
        );
      },
      Routes.colorPicker: (_) => const ColorPicker(),
      Routes.dialogs: (_) => const DialogsPage(),
    };
