//Seccion 12
//Lecciones:
//227.- Campos personalizados - parte 3
//228.- Foco de atención
//Arturo DLG
import 'package:flutter/material.dart';

/*
FormField tambien nos permite crear nuestros TextFields personalizados.

Existen 2 maneras de cambiar el foco de atencion en nuestros TextFields, una es 
usando textInputAction, y usando el miembro next para cambiar el foco al 
siguiente campo y send para poder enviar los datos; para poder enviar los datos 
del formulario una vez que hayamos presionado el boton del teclado, deberemos de 
pasarle un callback a nuestro textField mediante onSubmitted, para que se 
encargue de ejecutar el proceso necesario.
La otra manera de cambiar el foco es mediante la clase FocusNode, pero es menos 
optima, ya que consume mas recursos, requiere de usar el metodo dispose para 
liberarlos, ademas de requerir de mas codigo para hacer lo mismo que la primera 
opcion, por lo cual solamente es recomendable usar FocusNode cuando se requiere 
saber cuando el usuario ha presionado o dejado el widget.
*/

class LoginTextField extends FormField<String> {
  LoginTextField({
    super.key,
    required String label,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    void Function(String)? onSubmitted,
    bool obscureText = false,
  }) : super(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            String value = state.value ?? '';
            bool isOk = !state.hasError && value.isNotEmpty;
            return TextField(
              keyboardType: keyboardType,
              obscureText: obscureText,
              textInputAction: textInputAction,
              onSubmitted: onSubmitted,
              onChanged: (text) {
                state.didChange(text);
                if (onChanged != null) {
                  onChanged(text);
                }
              },
              decoration: InputDecoration(
                label: Text(label),
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: isOk ? Colors.green : Colors.black12,
                ),
              ),
            );
          },
        );
}
