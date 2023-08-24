//Seccion 5
//Lecciones:
//82 - 84: El widget Text
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget Text, nos permite dibujar texto en pantalla, asi como definir el tipo
de fuente, tamaño, estilo (cursiva, negrita, tachado, etc) y demas detalles de
su estilo. Tambien podemos emplearlo para textos largos, indicando el numero de
lineas a mostrar, indicar mediante algun simbolo si no se esta mostrando todo
el texto, entre otros aspectos.
*/

class TextLesson extends StatelessWidget {
  const TextLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      //Widget para centrar elementos
      child: DefaultTextStyle(
        style: TextStyle(), // Estilo del texto por Default
        child: Text(
          "Lorem Ipsum is simply dummy text"
          "of the printing and typesetting industry.",
          maxLines: 2, // definir en cuantas lineas se puede mostrar el texto
          overflow: TextOverflow.ellipsis, //indica mediante un simbolo que hay
          //texto que no se muestra en caso que las lineas indicadas son insuficientes
          style: TextStyle(
            fontSize: 30, //Tamaño de la fuente
            color: Colors.blue, // Color del texto
            //decoration: TextDecoration.none, //decoracion del texto
          ),
          textAlign: TextAlign.center, // alineacion del texto
        ),
      ),
    );
  }
}

/*
Notas: 
El enum textAling posee 2 valores llamados start y end, los cuales alinean el 
texto de acuerdo a lo que indique el widget padre Directionality, el cual le 
indica la orientacion del texto (de derecha a izquierda o visceversa), 
dependiendo la configuración del idioma que se encuentre.

El valor de start será donde se empiece a escribir y end en donde termine, 
segun la configuracion.
*/
