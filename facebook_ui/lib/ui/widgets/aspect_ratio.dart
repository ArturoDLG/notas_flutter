import 'package:flutter/material.dart';

/*
AspectRatio es un widget que nos permite mantener una relacion de tamaño para 
cualqueir widget hijo, para que se vea igual en cualquier pantalla.

Si su parametro aspectRatio es 1, el widget permanecera cuadrado, si es menor a 
1, se vera de manera rectangular con una altura mayor a la anchura, y si es mayor
a 1, sera rectangular con una altura menor al ancho.

Si AspectRatio no tiene una altura definida por un widget padre, este tratara de 
usar todo el espacio disponible.
*/

class MyAspectRatio extends StatelessWidget {
  const MyAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              'https://cdn.thingiverse.com/renders/35/40/97/6e/d2/2ca62e3c99b92957b3f3af2f94019529_preview_featured.jpg',
              //height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
