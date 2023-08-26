//Seccion 5
//Lecciones:
//96 - 97: El widget Column
//Arturo DLG
import 'package:flutter/material.dart';

/*
El widget Flexible nos permite redimensionar widgets para que utilicen solamente
el espacio disponible en pantalla, evitando asi errores de OwerFlow (error que
indica que un widget no se renderiza completamente en pantalla), siendo util 
para usarse en widgets Column y Row.
*/

class FlexibleLesson extends StatelessWidget {
  const FlexibleLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.black,
      ),
      child: Container(
        color: Colors.white,
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColumnItem(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Flexible(
                  // redimensionando un container
                  child: Container(
                    width: 500,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            ColumnItem(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                const Flexible(
                  // redimensionamos el texto en diferentes lineas
                  child: Text(
                    "qwertyuiopasdfghjklzxcvbnm, qwretyuiopsdfghjk ewqertyuio'dfghj, ",
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),
            ColumnItem(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 170,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 300,
                    height: 50,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            const ColumnItem(children: [
              Flexible(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              Flexible(
                flex: 2,
                child: FlutterLogo(
                  size: 200,
                ),
              ),
              Flexible(
                child: FlutterLogo(
                  size: 250,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class ColumnItem extends StatelessWidget {
  final List<Widget> children;
  const ColumnItem({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}


/*
Nota:
Para apreciar los cambios de manera sencilla, ejecutese en la web.

El widget Flexible hace que un Contaner se redimensione ocupando solamente el 
espacio disponible en pantalla.

Si Flexible se utiliza en Text, el texto hará salto de linea para ajustarse a la 
pantalla

El widet cuenta con un parametro fit, que le indica como debe de ocupar el 
espacio disponible, el cual tiene varias configuraciones:

* tight: Hará que ocupe todo el espacio disponible (tal cual lo hace un Expanded)
al menos que haya otro Flexible continuo sin esta configuracion de fit activada 
y haya espacio

Cuando usamos Flexible en un Column, si uno de nuestros widgets tiene texto a 
manera de lista, no tendremos error de OverFlow, pero el texto que no quepa en 
pantalla no sera mostrado debidamente.
*/