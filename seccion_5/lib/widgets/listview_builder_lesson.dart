//Seccion 5
//Lecciones:
//108 - 110: ListView
//Arturo DLG
import 'package:flutter/material.dart';

/* 
ListView.builder un factory constructor de ListView, el cual es util al momento
de renderizar grandes cantidades de widgets, porque a diferencia de su 
construtor por default que renderiza todo los widgets desde el inicio.
el factory construtor builder hace un calculo de cuantos widgets son visibles en
pantalla actualmente, en base a su tamaño, siendo asi mas eficiente sin afectar 
el perfomance de la app. Algunas de las diferencias respecto al construtor por
default, es que no definimos un parametro children, si no que usamos un builder
para crear los widgets y un itembuilder para especificar la cantidad de widgets 
a renderizar en total.

Otro factory constructor similar es ListView.separator, que es bastante similar 
a ListView.builder, con el agregado de imprimir un widget separador entre los
widgets del builder. Como dato adicional, es que el separador que usemos no sera
renderizado para el ultimo elemento del ListView. 
*/

class ListViewBuilderLesson extends StatelessWidget {
  const ListViewBuilderLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (_, index) {
          print('👍🏻');
          return Container(
            height: 100,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            color: Colors.orange,
            child: const FlutterLogo(),
          );
        },
      ),
    );
  }
}
