//Seccion 9: 191.- Diferenciar widgets del mismo tipo
//Arturo DLG
import 'package:flutter/material.dart';

/*
El parametro key de los widgets, es un parametro que utiliza Flutter para 
preservar el estado de este, cuando es movido dentro del arbol de widgets de la
aplicación. Este tiene 3 usos principales:

* Diferenciar widgets del mismo tipo
* Compatibles con widget testing
* Preservar el estado del widget

Existen 3 tipos de keys: ValueKey, que usa tipos de datos genericos que nos 
permite definir un tipo de dato como identificador; ObjectKey que usa la clase
padre para usar cualquier tipo de dato como identificador, y UniqueKey, que nos
genera un identificador unico para cada widget y no requiere especificar un tipo
de dato.

En el primer caso, los keys nos permite difernciar entre widgets que son del 
mismo tipo, dandoles un identificador unico, esto resulta util en casos como
hacer transiciones animadas entre elementos del mismo tipo como en el ejemplo
aqui presente.

Para este caso, cualquiera de los tipos de keys nos son utiles.

*/

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Text(
            _counter.toString(),
            key: ValueKey(_counter),
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_right_outlined),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}
