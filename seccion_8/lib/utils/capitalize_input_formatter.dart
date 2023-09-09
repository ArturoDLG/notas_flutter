//Seccion 8: 176. Input Formatters - parte 2
//ArturoDLG
import 'package:flutter/services.dart';

/*
Podemos crear nuestros propios TextInputFormatters para darle un comportamiento personalizado a un TextInput y usarlo en el parametro de inputFormatters.

Este ejemplo nos permite colocar en mayuscula la primera letra de nuestra busqueda.
*/

class CapitalizaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(_, TextEditingValue newValue) {
    final text = newValue.text.trimLeft();
    if (text.isEmpty) {
      return newValue;
    }

    final newText = '${text[0].toUpperCase()}${text.substring(1)}';

    // return newValue.copyWith(
    //   text: newText,
    //   selection: TextSelection(
    //     baseOffset: newText.length,
    //     extentOffset: newText.length,
    //   ),
    //   composing: TextRange(
    //     start: 0,
    //     end: newText.length,
    //   ),
    // );

    //Nota: cambiamos el codigo de ejemplo por retornar una nueva instancia de TextEditingValue con los valores deseados
    return TextEditingValue(
      text: newText,
      selection: TextSelection(
        baseOffset: newText.length,
        extentOffset: newText.length,
      ),
    );
  }
}
