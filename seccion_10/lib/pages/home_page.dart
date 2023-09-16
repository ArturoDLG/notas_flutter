//Seccion 10
//199.- findAncestorWidgetOfExactType
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_10/utils/screen_utils.dart';

/*
Cada widget que usa Flutter contiene un contexto, el cual es la informacion de
las caracteristicas que contiene, la cual es unica para cada uno. Si requerimos
de acceder a dicha informacion podemos usar el contexto para recuperar estos 
datoS, una manera es usando el metodo findAncestorWidgetOfExactType, el cual
nos permite encontrar recuperar el contexto de un widget padre de cierto tipo
si este se encuentra en el arbol de widgets, usando tipos genericos.
*/

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = context.findAncestorWidgetOfExactType<MediaQuery>();
    // print('👀 $mediaQuery');
    // final screenSize = mediaQuery!.data.size;
    final screenSize = context.screenSize;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '${screenSize.width}x${screenSize.height}',
        ),
      ),
    );
  }
}

/*
Nota:
findAncestorWidgetOfExactType encuentra al widget mas cercano en el arbol, si es
que existen multiples widgets del mismo tipo. Si el widget no es encontrado,
se devuelve null.

Existen widgets, que aunque no sean definidos por el programador, se encuentran
de manera interna en los widgets usados, como el caso de MaterialApp.
*/