import 'package:flutter/material.dart';

/*
MaterialColor es una clase que se compone de un color con 10 tonos de opacidad,
para poder crear un MaterialColor personalizado, basta con usar una instancia de 
Color con el color deseado y aplicar diferentes escalas de opacidad en un Map 
para pasarlo a una instancia de MaterialColor.
*/
MaterialColor generateMaterialColor(Color color) {
  final Map<int, Color> swatch = {};
  for (int i = 0; i < 10; i++) {
    late int key;
    if (i == 0) {
      key = 50;
    } else {
      key = i * 100;
    }
    final opacity = (.1 * i) + .1;
    swatch[key] = Color.fromRGBO(
      color.red,
      color.green,
      color.blue,
      opacity,
    );
  }
  return MaterialColor(color.value, swatch);
}
