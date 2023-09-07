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