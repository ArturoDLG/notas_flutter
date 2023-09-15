//Seccion 9:
//Lecciones
//195. Global keys parte 1
//197. Global keys parte 3
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_9/widgets/counter_button.dart';

/*
Cuando queremos cambiar un widget de posicion fuera de un widget de tipo lista,
los LocalKeys (los keys vistos en las lecciones anteriores de esta seccion) no
pueden ser utilizados. Para este caso, debemos de usar GlobalKeys para poder 
preservar su estado.

Las ventajas de los GlobalKeys, ademas de poder preservar el estado del widget,
es que puede acceder al contextto, permitiendole conocer detalles del widget,
como dimensiones, posicion en pantalla entre otros aspectos. Pero como 
desventaja es que consume mas recursos, por lo que solo deben ser usados en
caso de ser necesarios, ademas de no ser amigable en su uso en tests.

Otro uso de los GlobalKeys, es poder acceder a el estado del un StateFulWidget,
el cual nos permite acceder a los metodos que pueda tener para usarlos desde
otra parte de la aplicacion. Para esto, la clase del State deberá ser publica,
para poder usarla como tipo generico del GlobalKey y poder acceder a los
metodos. 
*/

class MovableWidgetPage extends StatefulWidget {
  const MovableWidgetPage({super.key});

  @override
  State<MovableWidgetPage> createState() => _MovableWidgetPageState();
}

class _MovableWidgetPageState extends State<MovableWidgetPage> {
  bool _inBody = true;
  final counterKey = GlobalKey<CounterButtonState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: !_inBody ? CounterButton(key: counterKey) : null,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              counterKey.currentState?.reset();
            },
            child: const Text('reset'),
          ),
          Switch(
              value: _inBody,
              onChanged: (value) {
                setState(() {
                  _inBody = value;
                });
              })
        ],
      ),
      body: _inBody ? CounterButton(key: counterKey) : null,
    );
  }
}
