//Seccion 10
//Lecciones:
//200 - 201.- Extensiones
//ArturoDLG
import 'package:flutter/material.dart';

/*
Las extensiones son una caracteristica de Dart que nos permite agregar a clases
ya definidas nuevos metodos, getters y setters, para extender su funcionalidad
de una manera mas elegante y comoda. Su sintaxis es la siguiente:

extension <NameExtension> on <Class>

Donde NameExtension es el nombre que se le da a la extension, usando CamelCase,
y Class es el nombre de la clase que se desea extender.

Esta caracteristica puede ser usada en cualquier clase de Dart, ya sea las que
vienen definidas en el lenguaje como datos definidos y paquetes como Flutter, 
siempre que estas clases sean publicas. 
*/

extension ScreenUtilsExtension on BuildContext {
  MediaQueryData get mediaQueryData {
    final mediaQuery = findAncestorWidgetOfExactType<MediaQuery>();
    return mediaQuery!.data;
  }

  double get statusBarHeight {
    return mediaQueryData.viewPadding.top;
  }

  Size get screenSize {
    return mediaQueryData.size;
  }
}

/*
Nota:
Es necesario importar el archivo donde se guarda la extension para poderlo usar.

Una restriccion de las extensiones es que no podemos definir propiedades a una
clase, unicamente metodos, getters o setters.
*/