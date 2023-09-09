//Seccion 8
//lecciones:
//180 - 181: Radio
//ArturoDLG
import 'package:flutter/material.dart';

/*
Radio es un widget que nos permite seleccionar una opcion de un conjunto de estas.
Tenemos 2 widgets que implementan esta funcion: Radio y RadioListTile.

Ambos widgets comparten 3 parametros principales:
* value
* groupValue: la variable donde se va a almacenar al opcion seleccionada, esta
debera aceptar valores nulos en caso de no ser seleccionada alguna opcion.
* onChanged: callback que registra si ha sido seleccionada la opcion.

Radio es un widget que simplemente nos muestra el selector, y este debe de 
acompañarse de otros widgets para ilustrar que opcion se esta seleccionando.

RadioListTile es un widget que nos permite agregar widgets que muestran que 
opcion esta siendo seleccionada de manera mas simple. Similar a CheckBoxListTile.

Ambos widgets pueden ser decorados usando ThemeData con el parametro radioTheme,
usando RadioThemeData (vease app_theme.dart), o haciendolo directamente en el 
widget.
*/

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  String? _better;
  String? _gender;
  String? _color;

  void _onBetterChanged(String? value) => setState(() {
        _better = value;
      });

  void _onGenderChanged(String? value) => setState(() {
        _gender = value;
      });

  void _onColorChanged(String? value) => setState(() {
        _color = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text('Witch is better?'),
            Row(
              children: [
                Radio<String>(
                    value: 'Flutter',
                    groupValue: _better,
                    onChanged: _onBetterChanged),
                const Text('Flutter'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'React Native',
                  groupValue: _better,
                  onChanged: _onBetterChanged,
                ),
                const Text('React Native'),
              ],
            ),
            const Divider(),
            const Text('What is your gender?'),
            Row(
              children: [
                Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: _onGenderChanged),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: _onGenderChanged,
                ),
                const Text('Female'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Other',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                const Text('Other'),
              ],
            ),
            const Divider(),
            const Text('What is your favorite color?'),
            RadioListTile<String>(
              title: const Text('Blue 🔵'),
              value: 'Blue',
              groupValue: _color,
              onChanged: _onColorChanged,
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              activeColor: Colors.blue,
            ),
            RadioListTile<String>(
              title: const Text('Red 🔴'),
              value: 'Red',
              groupValue: _color,
              onChanged: _onColorChanged,
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              activeColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
