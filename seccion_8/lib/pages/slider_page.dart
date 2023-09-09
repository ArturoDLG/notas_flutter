//Seccion 8
//lecciones:
//183 - 185: El widget Slider
//ArturoDLG
import 'package:flutter/material.dart';

/*
El widget slider es un widget que nos permite seleccionar el valor de un rango 
simplemente deslizando un tracker en una barra.

Slider contiene varios parametros, entre los cuales destacan:

* value: valor actual del slider.
* label: texto, generalmente se usa para mostrar el valor que estamos 
seleccionando.
* min y max: define el valor minimo y maximo del rango a seleccionar.
* divisions: define en cuantas partes se divide el rango.
* onChanged: un calbback que detecta cuado hacemos un cambio de valor.
* onChangedStart: un callback que detecta cuando inicamos a mover el slider.
* onChnagedEnd: un callback que detecta cuando terminamos de mover el slider.

Al igual que el resto de widgets de esta seccion, podemos personalizar la 
apariencia del widget a traves del ThemeData, usando una instancia de 
SliderThemeData en sliderTheme o directamente del widget. Podemos personalizar
los colores de las diferentes partes del widget y tamaños de sus elementos.

Por defecto, solamente podemos usar el widget de manera horizontal, si lo 
queremos usar de manera vertical, debemos de envolverlo en un widget RotatedBox,
el cual lo rota mediante el parametro quarterTurns, donde los valores impares
lo dejan de manera vertical, aunque contamos con desventajas de que su ticket
se vera de manera vertical, o que sus dimensiones se deben de dar en un SizedBox
que envuelva al RotatedBox. Crear un Slider personalizado requiere de 
conocimientos avanzados en Flutter.
*/

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 0;
  double _value2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Slider(
                value: _value,
                label: _value.floor().toString(),
                max: 100,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _value = value.floorToDouble();
                  });
                },
              ),
              SizedBox(
                height: 300,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 5,
                    ),
                    child: Slider(
                      value: _value2,
                      label: _value2.floor().toString(),
                      thumbColor: Colors.greenAccent.shade700,
                      max: 10,
                      divisions: 10,
                      onChanged: (value) {
                        setState(() {
                          _value2 = value.floorToDouble();
                        });
                      },
                      onChangeStart: (_) {
                        print('🏃🏻‍♂️');
                      },
                      onChangeEnd: (_) {
                        print('🏁');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
El valor que nosotrso definamos en el parametro value, debe de estar dentro del 
rango establecido en los parametros min y max. 
*/