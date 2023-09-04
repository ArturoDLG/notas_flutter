//Seccion 6
//Lecciones:
//138: Nuestro primer StatefulWidget
//139: initState
// ArturoDLG
import 'package:flutter/material.dart';

/*
Un StatefulWidget es un widget que nos permite actualizar su apariencia en 
en tiempo real.

Para esto, implementamos 2 clases, una que extiende de SatefulWidget en el cual 
se debe de sobreescribir el metodo createState() que retorno nuestra segunda 
clase. La segunda clase hereda de State, el cual funciona similar a 
StatelessWidget, pero contiene otros metodos como:

* initState: este metodo nos permite inicializar el estado de nuestro widget 
antes de renderizarlo, pues se llama una sola vez cuando el widget va a ser 
insertado en el arbol de widgets.

*dispose: este metodo se llama cuando se elimina el widget, en el se liberan 
todos los recursos utilizados por el widget.

State usa tipos genericos, en este caso, nosotros debemos de pasarle el 
StatefulWidget vinculado a este para poder acceder a las propiedades definidos 
en este.
*/
class CounterPage extends StatefulWidget {
  final int initialValue;
  const CounterPage({
    super.key,
    this.initialValue = 0,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int counter;

  @override
  void initState() {
    //inicializamos nuestro counter con el valor pasado al widget
    counter = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          counter++;
          //notificamos que hemos hecho un cambio
          setState(() {});
        },
      ),
    );
  }
}


/*
Nota:
Cuando actualizamos algun dato dentro de nuestro widget, debemos de llamar al 
metodo setState, el cual notifica que el widget debe de ser renderizado 
nuevamente para visualizarse los cambios.

La diferencia entre un StatelessWidget y un StatefulWidget es que el primero 
cuando lo actualizamos, realizamos una nueva instancia del widget, mientras que 
en un StatefulWidget si bien se crea una nueva instancia, Flutter detecta esto y 
utiliza el estado anterior para el nuevo widget.
*/