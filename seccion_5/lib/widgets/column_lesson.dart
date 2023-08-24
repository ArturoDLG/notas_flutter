//Seccion 5
//Lecciones:
//91 - 93: El widget Column
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget Column, es un widget que nos permite agrupar varios widgets de manera
vertical, asi como indicar la distribucion que queremos que haga a lo largo de 
este, ademas que cuenta con widgets complementarios como expanded y spacer que
ayudaran a configurar al mismo, esto tambien es aplicable al widget Row.
*/

class ColumnLesson extends StatelessWidget {
  const ColumnLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.black,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        color: Colors.white,
        child: Center(
          child: Container(
            color: Colors.grey,
            child: Column(
              //mainAxisSize: MainAxisSize.min, //espacio a ocupar
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, //alinear los elementos
              children: [
                const Text("Hello"),
                const Text(
                  "World",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold, //Grosor del texto
                  ),
                ),
                //const Spacer(), // Widget que ocupa todo el espacio disponible
                // en un Column/Row
                Expanded(
                  // Expande un widget con toda la altura disponible dentro de
                  //un Column/Row
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.pinkAccent,
                  ),
                ),
                Expanded(
                  flex: 3, //
                  child: Container(
                    height: 100,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
Notas:
El widget Column, siempre ocupara el alto del widget padre que lo envuelva, al 
menos que lo especifiquemos en el parametro mainAxisSize.

Por defecto, el column agrupa a todos los elementos que contiene uno seguido de 
otro, para darles una separacion, podemos utilizar las siguientes estrategias:
* Si usamos containers dentro del Column, podemos usar margin para separarlos de 
los demas elementos.

*Podemos colocar SizedBox entre los elementos para dar un espacio entre los 
elementos.

Podemos usar Columns dentro de un Column para agrupar widgets y tener 
comportamientos personalizados.

Si se tiene mas de un Expanded en un Column/Row, su tamaño sera distribuido de 
manera equitativa si no se modifica el parametro flex. La proporcion de espcio 
que se reparten entre los flex, sera en proporcion a la suma de los valores 
puestos en flex.
*/