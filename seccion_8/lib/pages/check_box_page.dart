//Seccion 8
//lecciones:
//177 - 179: CheckBox
//ArturoDLG
import 'package:flutter/material.dart';

/*
CheckBox es un widget que nos permite indicar valores booleanos de manera grafica,
es un wdget bastante comun al momento de indicar si estamos de acuerdo o no con
terminos y condiciones de una app, o si deseamos activar o desactivar alguna 
caracteristica.

Alguna de las propiedades es indicar su valor, donde false indica que el CheckBox
esta desmarcado y true que esta seleccionado. Tambien cuenta con un callback
onChanged para llamar cuando presionamos el widget.

Para personalzarlo podemos hacerlo a traves del ThemeData mediante el parametro
checkBoxTheme, el cual usando una instancia de CheckBoxThemeData podemos 
personalizar el color del check (palomita), relleno y forma por mencionar algunos
paramteros (vease app_theme.dart), o podemos hacerlo directamente desde la 
clase.

Si queremos tener un texto a lado de nuestro CheckBox y que este cambie de estado
al preisonar tanto el texto como el CheckBox, podemos usar el widget
CheckBoxListTile, el cual nos permite tener dicho comportamiento, ademas de tener
opciones de personalizacion propias como la posicion del CheckBox, padding y
el espacio de separacion con VisualDensity.
*/

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Text("""
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          """),
                Checkbox(
                  value: _checked,
                  //tristate: true,
                  onChanged: (value) {
                    //print('👀 $value');
                    if (value != null) {
                      setState(() {
                        _checked = value;
                      });
                    }
                  },
                ),
                Checkbox(
                  value: _checked,
                  fillColor: MaterialStateProperty.all(
                    Colors.blue,
                  ),
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onChanged: (value) {
                    // if (value != null) {
                    //   setState(() {
                    //     _checked = value;
                    //   });
                    // }
                    setState(() {
                      _checked = value ?? _checked;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _checked,
                  title: const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _checked = value;
                      });
                    }
                  },
                ),
                MaterialButton(
                  onPressed: _checked ? () {} : null,
                  child: const Text('Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
Nota: 
Podemos hacer nuestra propia implementacion de CheckBoxListTile usando un Row 
que una a un CheckBox y a un Text, estos envueltos en un GestureDetector para
obtener el mismo comportamiento, pero e debera repetir la funcion para cambiar
el estado tanto en el GestureDetector como en el CheckBox, lo que lo hace una
implementacion redundante, pero util si queremos un estilo propio.  
*/