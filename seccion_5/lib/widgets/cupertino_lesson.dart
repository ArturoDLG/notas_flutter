//Seccion 5
//115: CupertinoApp
//Arturo DLG
import 'package:flutter/cupertino.dart';

/* 
Cupertino es un paquete de widgets que tiene el estilo de las apps para iOS de 
apple. Si bien Flutter permite combinar diferentes estilos de widgets en una 
misma app, existen algunas excepciones, tal es el caso entre Scaffold y 
CupertinoPageScaffold, donde el primero no es compatible con CupertinoApp, pero 
el segundo si, esro debido a la cantidad de parametros que Scaffold contiene, 
siendo mas personalizable en comparacion a su contraparte de Cupertino.

Otra caracteristica de los paquetes Material y Cupertino es que comparten 
widgets con los mismos parametros, por lo que su uso sera indistinto del estilo 
que se adopte para la app.

Material en comparacion a Cupertino, tiene mas personalizacion dentro de Flutter.
*/

class CupertinoLesson extends StatelessWidget {
  const CupertinoLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Hello Cupertino"),
      ),
    );
  }
}

/* 
*/