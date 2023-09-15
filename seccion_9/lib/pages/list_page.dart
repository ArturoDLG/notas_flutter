//Seccion 9: 196. Global Keys parte 2
//ArturoDLG
import 'package:flutter/material.dart';

/*
Otro ejemplo de uso de GlobalKey, es cuando usamos un widget que renderiza una 
vista cuando se realiza un cambio (como OrietationBuilder que cambia la vista
cuando se cambia de orientacion de pantalla) para preservar su estado.
Esto se logra, ya que Flutter usa el estado anterior del widget con la
GlobalKey para generar el nuevo widget.
*/

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (_, orientation) {
        final listView = ListView.builder(
          key: listKey,
          itemCount: 1000,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text('$index'),
            );
          },
        );
        if (orientation == Orientation.portrait) {
          return Column(
            children: [
              const Text('PORTRAIT'),
              Expanded(
                child: listView,
              ),
            ],
          );
        }

        return Row(
          children: [
            const Expanded(child: Text('PORTRAIT')),
            Expanded(
              child: listView,
            ),
          ],
        );
      }),
    );
  }
}
