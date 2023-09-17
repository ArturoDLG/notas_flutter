//Seccion 10
//Lecciones:
//205 - 207.- GlobalKey [dimensiones de un widget/
//                       posición de un widget/
//                       conocer si un widget aun forma parte del arbol de
//                       widgets]
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_10/mixins/after_first_layout_mixin.dart';
import 'package:seccion_10/pages/home_page.dart';
import 'package:seccion_10/utils/screen_utils.dart';

/*
Los GlobalKeys nos permite acceder a el contexto de un widget en especifico, 
pudiendo asi obtener informacion como:

* Dimensiones: a traves de hacer un cast a RenderBox al metodo 
currentContext!.findRenderObject() podremos obtener el tamaño del widget.

* Posicion: a traves del RenderBox que nos ofrece el metodo anterior, podemos 
usar su metodo localToGlobal() para conocer la posicion del widget respecto a
a un widget padre (por defecto, sera el mas cercano si no definimos el
renderObject del widget padre que queremos de referencia). El metodo recibe como
parametro un Offset, el cual sera el punto de referencia de donde tomaremos la
posicion del widet, siendo [0,0] la esquina superior izquierda.

* Conocer si un widget aun pertenece al arbol de widgets: Un GlobalKey nos 
permite saber si un widget aun se encuentra dentro del arbol, esto lo podemos
ver werificando si sus parametros currentContext o CurrentWidget son diferentes
de null. Esto nos sirve cuando destruimos una vista y queremos ver si el contexto
que usamos para navegar aun esta en el arbol de widgets. Esto solamente aplica
en el caso de los StateLessWidgets, puesto que en los StateFulWidgets, solamente
bastara con usar el getter mounted. Podemos replicar una funcionalidad similar
usando un mixin (vease MountedMixin.dart).
*/

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with AfterFirstLayoutMixin {
  int _counter = 30;
  final _textKey = GlobalKey();
  final _safeAreaKey = GlobalKey();

  @override
  void onAfterFirtsLayout() {
    //print('🏁');
    _printTextSize();
  }

  @override
  Widget build(BuildContext context) {
    //print('👀');
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
            ),
            onPressed: _showDialog,
          ),
        ],
      ),
      body: SafeArea(
        key: _safeAreaKey,
        child: Center(
          child: Text(
            "$_counter",
            key: _textKey,
            style: TextStyle(
              fontSize: _counter.toDouble(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
      ),
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
    //el metodo addPostFrameCallback nos permite conocer cuando se ha terminado
    //de renderizar una vista
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //print('🔁');
        _printTextSize();
      },
    );
  }

  void _printTextSize() {
    final renderBox = _textKey.currentContext!.findRenderObject() as RenderBox;
    //tamaño de la pantalla
    final screenSize = context.screenSize;

    //posicion tomando como referencia la esquina superiro izquierda de la
    //pantalla
    // final position = renderBox.localToGlobal(
    //   Offset.zero,
    // );

    //posicion tomando como referencia el centro de la pantalla
    final position = renderBox.localToGlobal(
      Offset(
        -screenSize.width * .5,
        -screenSize.height * .5,
      ),
      ancestor: _safeAreaKey.currentContext!.findRenderObject(),
    );

    print('Size: ${renderBox.size}');
    print('Position $position');
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: const Text('Hello'),
          actions: [
            TextButton(
              onPressed: () async {
                await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );

                //mounter es un getter que nos devuelve un booleano indicando si
                //el widget aun se encuentra en el arbol
                if (mounted) {
                  print('🌲');
                }
                ;
              },
              child: const Text('Go to Home'),
            ),
          ],
        );
      },
    );
  }
}
