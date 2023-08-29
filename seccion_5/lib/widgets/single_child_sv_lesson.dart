//Seccion 5
//Lecciones:
//106 - 107: El widget SingleChildScrollView
//Arturo DLG
import 'package:flutter/material.dart';

/*
SingleChildScrollView, es un widget que nos permite hacer scroll en un grupo de
widgets (agrupados en un Row o un Column) que no pueden ser mostrados en su 
totalidad en pantalla, evitando asi errores de OverFlow.

El widget nos permite definir la direccion de scroll, donde inicia a mostrar los
elementos, comportamiento de teclado, entre otras configuraciones.
*/

class SingleChildSVLesson extends StatelessWidget {
  const SingleChildSVLesson({super.key});

  List<Container> containers() {
    return List.generate(
      18,
      (index) => Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        color: Colors.primaries[index],
        child: Text('$index'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                //cambiar la orientacion del scroll
                scrollDirection: Axis.horizontal,
                //Cambiar fisicar del scroll
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: containers(),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                //la vista se va hasta el final del scroll
                reverse: true,
                padding: const EdgeInsets.all(10),
                //ocultar el teclado cuando hacemos scroll
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(),
                    ),
                    ...containers(),
                  ],
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

Un SingleChildScrollView no puede tener dimensiones dinamicas, por lo que
el widget padre debe de darle dichas dimensiones.

Si queremos que el usuario no pueda realizar scroll en el widget, debemos de 
cambiar el parametro physics por NeverScrollableScrollPhysics()

El uso de SingleChildScrollView no es recomendable para renderizar una gran 
cantidad de widgets en pantalla. En su lugar se recomienda usar ListView
*/
