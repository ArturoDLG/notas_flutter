//Seccion 8
//lecciones:
//182: El widget Switch
//ArturoDLG
import 'package:flutter/material.dart';

/*
Switch es un widget similar a CheckBox, con la unica diferencia que su apariencia
es diferente (uno tiene apariencia de un apagador, mientras que el otro de un
cuadrado de lista), compartiendo asi todos sus parametros (vease 
check_box_page.dart).

Tambien tiene una contraparte SwitchListTile que nos permiteAgregar texto u otro
widget que apoye visualmente a saber que funcion tiene.

Su personalizacion es similar, siendo posible editar directemente del widget 
como del ThemeData con el parametro switchTheme, unicamente no permite editar 
los colores cuando el swicth esta inactivo, esto se debe de hacer directamente
del widget.
*/

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Switch(
            value: _checked,
            onChanged: (value) {
              setState(() {
                _checked = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Push notifications'),
            controlAffinity: ListTileControlAffinity.leading,
            inactiveTrackColor: Colors.pink.shade100,
            inactiveThumbColor: Colors.deepPurpleAccent.shade100,
            value: _checked,
            onChanged: (value) {
              setState(() {
                _checked = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: _checked ? () {} : null,
            child: const Text('NEXT'),
          ),
        ],
      ),
    );
  }
}
