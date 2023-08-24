//Seccion 5
//Lecciones:
//85 - 90: El widget Container
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget container, es un widget que nos permite crear graficos a traves de un
rectangulo, el cual es capaz de contener otros widgets en su interior.
Entre las caracteristicas que posee se encuentra el darle color, degreadados, 
sombras, cambiar la forma de contorno e incluso de la propia figura; nos permite
indicar espacios entre otros elementos y margenes dentro de el, lo que lo hace
un widget bastante versatil.
*/

class ContainerLesson extends StatelessWidget {
  const ContainerLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: DefaultTextStyle(
        style: const TextStyle(),
        child: Container(
          //color: Colors.white, // Color del container
          width: 200, // ancho
          height: 200, //alto
          margin: const EdgeInsets.only(
            //margen respecto al borde del widget padre
            left: 20,
          ),
          alignment: Alignment.topCenter, //Alinear el widget contenido
          padding: const EdgeInsets.only(
            top: 10,
          ), //separar el widget del borde
          decoration: BoxDecoration(
            // decorar un container
            //color: Colors.blue, //color
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ), //borde del container
            //shape: BoxShape.circle, //forma del Container
            boxShadow: [
              //sombras de un container
              BoxShadow(
                color: Colors.cyan.withOpacity(
                  .8,
                ),
                blurRadius: 10, // radio de la sombra
                offset: const Offset(10, 20), //mover la sombra
                //spreadRadius: 100, // tamaño de la sombra
              ),
              // BoxShadow(
              //   color: Colors.yellow.withOpacity(
              //     .9,
              //   ),
              //   blurRadius: 15, // radio de la sombra
              // ),
            ],
            gradient: const LinearGradient(
              // gradiente
              colors: [
                Colors.red,
                Colors.blue,
                Colors.orange,
              ],
              stops: [
                .1,
                .75,
                1,
              ], //tamaños del degradado
              begin: Alignment.topLeft, //inicio del gradiente
              end: Alignment.bottomRight, //fin del gradiente
            ),
          ),
          child: const Text(
            "Arturo DLG",
            style: TextStyle(
              color: Colors.black,
            ),
          ), //Puede contener otros widgets
        ),
      ),
    );
  }
}

/*
Notas: 
La clase EdgeInsets nos permite definir un margen interno [padding] a un widget 
(en este caso un Container) a traves de sus factories constructors.

* Only nos permite definir el tamaño del margen para cada lado del container
* All nos permite definir un margen del mismo tamaño para todos los lados
* Symmetric nos permite definir un margen igual para el par paralelo de lados

La clase BorderRadius nos permite darle forma a los bordes del container con sus 
diferentes factories construtors, los cuales pueden afectara un lado en 
especifico, algun par o todos lados, cambiando la apariencia e incluso toda la 
forma del container.

Si usamos shape en nuestro BoxDecoration, no podremos usar borderRadius.

En una lista de BoxShadows, el ultimo elemento será el que este arriba de las 
sombras.

En el parametro stops de un gradient, la lista debe de contener la cantidad de 
colores definido en el parametro colors; estos deberan ser de tipo double con 
valores que van de 0 a 1, indicando el porcentaje donde finaliza dicho color.

El widget SizedBox es util cuando requerimos definir solamente la altura y/o 
anchura de un widget, pues utilza menos recursos que un Container.

Un Container necesita saber donde debe de alinearse para tomar el valor de sus
dimensiones definidas, de lo contrario, tratará de expandirse al tamaño del 
widget padre mas cercano que tenga.

Si un Container no contiene alguna de sus dimensiones, ocupará todo el espacio 
que tenga disponible. 

Un Container puede calcular sus dimensiones en base al widget hijo que contenga
(en caso tenga uno) si no se define un aligment, por lo cual tomará en cuenta 
las dimensiones del widget hijo, y en caso de tener un padding definido, sumara
los valores que se hayan puesto. Esto solamente pasará si el Container tiene 
definido su alineación.
*/