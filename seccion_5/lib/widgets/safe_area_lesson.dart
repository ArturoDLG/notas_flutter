//Seccion 5
//105: El widget SafeArea
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget SafeArea, es un widget que nos permite mostrar elementos, previniendo 
que se rendericen sobre el statusBar o bottomNavigation de nuestros dispositivos
para ser visualizados correctamente.
*/

class SafeAreaLesson extends StatelessWidget {
  const SafeAreaLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: const SafeArea(
                  //bottom: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hello'),
                      Text('World'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: const SafeArea(
                  top: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hello'),
                      Text('World'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Nota:
SafeArea cuenta con un margen para mostrar los widgets dentro de el,
correspondiente al la altura del statusBar y el bottomNavigation, el cual se 
aplica siempre, incluso si el widget no se renderiza cerca de estos. Por lo
que si queremos ignorar estos margenes, bastará con cambiar el valor booleano 
del parametro para cambiar el comportamiento. 

Al parecer, en la version 13 de Android, Flutter no renderiza por defecto por 
debajo de su barra de navegacion, por lo que el margen de bottom lo ignora. 
*/
