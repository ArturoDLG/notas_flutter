//Seccion 8
//lecciones:
//171: Modos de teclado
//172: InputDecorationTheme
//ArturoDLG
import 'package:flutter/material.dart';
import 'material_color_generator.dart';

/*
Si nostros queremos tener una configuracion global para todos los TextField que
definamos en nuestra app, sin tener que darle estilo uno a uno, podemos hacerlo
a traves del ThemeData. Hemos creado una funcion que retorna un ThemeData 
personalizado.

Para modificar a los TextField, usamos el parametro InputDecorationTheme, que 
nos permite definir los estilos a usar para todos los widgetes de este estilo 
tal como lo hicimos en la leccion 170 (ver text_field_page.dart)
*/

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    primarySwatch: generateMaterialColor(
      const Color(0xff1565C0),
    ),
    // colorScheme: const ColorScheme.light(
    //   primary: Colors.amber,
    // ),
    //Decoracion de un TextField
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: Colors.amber,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 3),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: Colors.black12,
        ),
      ),
    ),
    //Decoracion de un CheckBox
    checkboxTheme: CheckboxThemeData(
      //color del check (palomita)
      checkColor: MaterialStateProperty.all(
        Colors.green,
      ),
      //color de relleno
      fillColor: MaterialStateProperty.all(
        Colors.amber,
      ),
      overlayColor: MaterialStateProperty.all(
        Colors.greenAccent.withOpacity(.5),
      ),
      shape: const CircleBorder(),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(
        Colors.orangeAccent,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
        Colors.deepPurple,
      ),
      trackColor: MaterialStateProperty.all(
        Colors.pinkAccent,
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.cyanAccent,
      thumbColor: Colors.blue.shade800,
      overlayColor: Colors.blue.withOpacity(.2),
      inactiveTrackColor: Colors.purple.withOpacity(.3),
      inactiveTickMarkColor: Colors.purple,
      trackHeight: 15,
      valueIndicatorColor: Colors.blueGrey,
      thumbShape: const RoundSliderThumbShape(
        enabledThumbRadius: 15,
      ),
    ),
  );
}

/*
Nota:
El color del texto flotante puede ser modificado con el parametro 
floatingLabelStyle, pero este modificará el estilo tanto para el caso que este 
el foco de atención en el TextField como el caso contrario.Podemos cambiar eso 
modificando el color primary del colorScheme, pero si hacemos esto, modificaremos 
los colores del resto de widgets que dependen de este.
*/