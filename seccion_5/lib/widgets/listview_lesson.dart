//Seccion 5
//Lecciones:
//108 - 110: ListView
//Arturo DLG
import 'package:flutter/material.dart';
import 'package:seccion_3/widgets/listview_builder_lesson.dart';

/*
ListView es un widget que nos permite tener una coleccion de elementos en 
pantalla y hacer scroll sobre ellos, similar a un SingleChildScrollView, pero 
con la diferencia que en este widget definimos el widget en un List.

Los parametros que contiene ListView son similares a los de un 
SingleChildScrollView, salvo la caracteristica de usar una lista de widgets en 
lugar de usar Columns o Rows para renderizar a estos.

ListView tambien contiene factories constructors, especificados en el archivo
listview_builder_lesson.dart.
*/

class ListviewLesson extends StatelessWidget {
  const ListviewLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            IconButton(
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (_) => const ListViewBuilderLesson(),
                );

                Navigator.push(context, route);
              },
              icon: const Icon(
                Icons.surfing,
                size: 50,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  18,
                  (index) => Container(
                    width: 100,
                    alignment: Alignment.center,
                    color: Colors.primaries[index],
                    child: Text('$index'),
                  ),
                ),
              ),
            ),
            ListView(
              //Ajustar la altura del ListView a los elementos que contiene
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const TextField(),
                ...List.generate(
                  5,
                  (index) => Container(
                    height: 75,
                    margin: const EdgeInsets.all(10),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Container(
              height: 350,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Nota:
Por defecto, ListView tiene un padding como SafeArea en la parte superior, este 
se desactiva cuando usamos un padding personalizado.

Al igual que un SingleChildScrollView, un ListView debe de tener definido sus 
dimensiones por el widget padre 

Si nosostros activamos el parametro shrinkWrap, el cual calcula la altura del
listview en base a los widgets hijos, deberiamos de desactivar las fisicas de 
desplazamiento del widget.
*/

