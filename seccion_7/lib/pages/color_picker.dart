//Seccion 7: 152. Retornar datos de una ruta
//ArturoDLG
import 'package:flutter/material.dart';

/*
Para retornar un valor de la pagina actual, a la anterior de donde navegamos, la
funcion Navigator.pop nos ofrece un parametro opcional, al cual podemos pasarle
dicho valor a la pagina anterior.

Para capturar dicho valor, en la pagina donde esperamos el valor deberemos de 
trabajar de manera asincrona, ya sea usando el metodo .ther en la funcion
de Navigator que estemos usando, o usando asyn y await.

Cuando trabajamos usando MaterialPageRoute, debemos de especificar nuestro dato
generico para saber que tipo de dato esperemos. Para el caso de que usemos rutas,
deberemos de castear la funcion con el tipo de dato que esperamos, indicando que 
este puede ser nulo. 
*/

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Colors.primaries.length,
          itemBuilder: (_, index) {
            final color = Colors.primaries[index];
            return GestureDetector(
              child: Container(
                height: 70,
                color: color,
              ),
              onTap: () {
                Navigator.pop(
                  context,
                  color, // retornamos el color seleccionado
                );
              },
            );
          }),
    );
  }
}
