//Seccion 5
//Lecciones:
//99 - 100: El widget Stack
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget Stack, es un widget que nos permite agrupar varios elementos, con la 
diferencia que estos van unos sobre otros (como su nombre lo suguiere: pila). 
Stack nos permite agrupar el conjunto de elementos en diferentes posiciones a lo 
largo del widget padre que lo contenga.
Este cuenta con un widget complementario, Positioned, el cual nos permite darle
una posicion personalizada a un elemento en particular dentro del stack.
*/

class StackLesson extends StatelessWidget {
  const StackLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.black,
      ),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            color: Colors.grey,
            width: 500,
            height: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                ),
                Positioned(
                  //Darle a un widget una posicion personalizada
                  top: 10,
                  left: 10,
                  right: 10,
                  //width: 100, //ignora las dimensiones establecidas
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ),
                const Text(
                  'Hi',
                ),
                const Positioned(
                  //podemos usar valores negativos para nuestro Positioned
                  bottom: -30,
                  right: -10,
                  child: FlutterLogo(
                    size: 100,
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
La forma en como agreguemos los widgets a Stack sera el orden en el que 
apareceran en pantalla, siendo el primero el que se encontrará en el fondo y el
ultimo estará sobre todos. 

El parametro aligment de Stack utiliza por defecto AligmentDirectional, el cual
se diferencia de Aligment porque su comportamiento es similar al de 
TextDirection, donde depende de la configuracion de Directionality para 
orientarse.

Si utilizamos el widget Positioned, podemos redimensionar un widget como un 
Container, ya sea que definamos los parametros width y heigth en este widget,
o definamos sus posiciones como top - bottom o rigth - left, tomando asi el 
espacio disponible y restando los valores definidos. En ambas configuraciones, 
el widget child va a ignorar sus dimensiones para tomar las dadas por Positioned.

Positioned tiene factories constructors, como Positioned.fill, que hara que el 
widget hijo ocupe todo el espacio disponible.

El widget Stack, define su tamaño en base al widget padre mas cercano, si este 
tiene sus dimensiones establecidas, de lo contrario lo hará mediante el tamaño 
que tengan sus widgets hijos. Si usamos Positioned.fill y no hay dimension 
establecida en un widget padre del Stack, entonces el stack ocupará todo el 
espacio definido.
*/
