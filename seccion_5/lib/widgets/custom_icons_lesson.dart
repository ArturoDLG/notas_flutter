//Seccion 5
//Lecciones:
//113 - 114: Fuentes personalizadas
//Arturo DLG
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:seccion_3/icons/custom_font.dart';
import 'package:seccion_3/icons/other_font.dart';

/*
Icon es un widget que nos permite mostrar iconos, para inidcar funciones o 
secciones en nuestra app defecto tenemos los iconos de Material y Cupertino.

Podemos agregar nuestros propios iconos convirtiendo imagenes svg en un archivo
de fuentes .ttf usando un convertidor que nos dara un archivo .ttf y una clase
de Dart para poderlos usar al igual que Icons y CupertinoIcons. El archivo
.ttf lo agregamos dentro de los assets y el .dart en lib dentro de una carpeta
propia, e indicamos en el pubspec.yaml que agregamos una fuente para usar.
*/

class CustomsIconsLesson extends StatelessWidget {
  const CustomsIconsLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Cupertino
            Icon(
              CupertinoIcons.ant,
              size: 50,
              color: Colors.orange,
            ),
            //Material
            Icon(
              Icons.alarm_outlined,
              size: 50,
              color: Colors.blueAccent,
              //parametro para accesibilidad [problemas de vision]
              semanticLabel: 'Alarma',
            ),
            //iconos personalizados
            //no se pueden visibilizar
            // Icon(
            //   CustomFontIcons.linux,
            //   size: 50,
            //   color: Colors.red,
            // ),
            Icon(
              OtherFontIcons.markdown,
              size: 50,
              color: Colors.cyan,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Nota:

Si agregamos nuevos iconos a nuestro paquete, deberemos reemplazar los archivos
.json, .ttf y .dart por los nuevos para actualizarlo.
*/
