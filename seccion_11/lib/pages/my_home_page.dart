//Seccion 11
//Lecciones:
//208 - 209.- Plantamiento del problema
//210 - 215.- Inherited Widgets
//Arturo DLG
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:seccion_11/global/theme_controller.dart';
import 'package:seccion_11/state_management/consumer.dart';
//import 'package:seccion_11/main_inherited.dart';
//import '../state_management/provider.dart';
import '../widgets/counter_text.dart';

/*
Cuando construimos widgets personalizados, puede dar el caso que necesitemos 
dividir a este en varias clases para poder tener un codigo mas limpio y 
escalable, por consecuencia, se podria dar el caso que algunos de los 
parametros que pasamos al widget padre, sean requeridos por los widgets hijos.

Una solucion a esto, seria pasar el parametro de manera anidada, pero esto es
poco optimo, ya que hacer un cambio en dicho parametro, requeriria de hacerlo
en todos los constructores que anidamos.

Otra solucion, es usando el contexto de los widgets hijos para usar los 
parametros del widget padre a traves del metodo findAncestorStateOfType(), pero
esto conlleva a presindir del uso de const en el constructor ya que usarlo
impide actualizar la vista aunque usemos setState(), lo que podria perjudicar
el perfomance de la app.

Una mejor solucion es el uso de InheritedWidget, el cual nos permite extender 
una clase que permite usar a los widgets hijos usar sus parametros a traves
del contexto mediante el parametro dependOnInheritedWidgetOfExactType() (del 
contexto), esto sin que los widgets hijos presindan del uso de const de su
constructor y teniendo un codigo mas limpio.

Los InheritedWidgets se actualizan gracias a su metodo updateShouldNotify, el 
cual notifica a todos los widgets hijos que escuchan algun cambio a traves de
context.dependOnInheritedWidgetOfExactType si deberan volver a renderizarse
cuando se llama a setState. Este metodo devuelve un booleano, por lo que se 
recomienda realizar una comprobacion para verificar si dichos datos se han 
actualizado para renderizarse, optimizando asi la app de renderizaciones 
innecesesarias.
*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _color = Colors.cyan;
  double _fontSize = 20;

  int get counter => _counter;
  Color get color => _color;

  void _incrementCounter() {
    setState(() {
      _counter++;
      final index = Random().nextInt(
        Colors.primaries.length - 1,
      );
      _color = Colors.primaries[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = ThemeProvider.of(context);
    //final themeController = Provider.of<ThemeController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          // Switch(
          //   value: themeController.isDarkModeEnable,
          //   onChanged: (_) {
          //     themeController.toggleTheme();
          //   },
          // ),
          Consumer<ThemeController>(
            builder: (_, controller) => Switch(
              value: controller.isDarkModeEnable,
              onChanged: (_) {
                controller.toggleTheme();
              },
            ),
          ),
          IconButton(
            onPressed: () => setState(() {
              _fontSize++;
            }),
            icon: const Icon(
              Icons.font_download,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyHomePageProvider(
              color: _color,
              counter: _counter,
              child: const CounterText(),
            ),
            Text(
              _fontSize.toString(),
              style: TextStyle(fontSize: _fontSize),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyHomePageProvider extends InheritedWidget {
  final int counter;
  final Color color;

  const MyHomePageProvider({
    Key? key,
    required this.counter,
    required this.color,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(MyHomePageProvider oldWidget) {
    // print('old: ${oldWidget.counter}');
    // print('new: $counter');
    return oldWidget.counter != counter || oldWidget.color != color;
  }

  static MyHomePageProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<MyHomePageProvider>();

    //comprobamos si provider viene de un InheritedWidget
    assert(
      provider != null,
      "Invalid context, Could not find a MyHomePageProvider with the passed context",
    );

    return provider!;
  }
}
