//Seccion 12: 224.- Validaciones usando mixins
//Arturo DLG
import 'package:flutter/widgets.dart' show State;
import 'package:seccion_12/pages/login/login_page.dart';

/*
Una manera de mantener nuestro codigo mas legible, es mandando las validaciones
de nuestro formulario a un mixin, donde colocamos en metodos la logica necesaria
y despues emplearla en el formulario.

Una ventaja de usar mixins, es que podemos restringir a que este solamente sea
usado en la vista usando 'on State<-StateFulWiidget->' donde colocaremos
el widget de la vista que hemos creado.
*/

mixin LoginMixin on State<LoginPage> {
  String? emailValidator(String? text) {
    text ??= ''; // text = text ?? '';
    final isValid = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    ).hasMatch(text);
    if (isValid) {
      return null;
    }
    return 'Invalid email';
  }

  String? passwordValidator(String? text) {
    text ??= '';
    text = text.replaceAll(' ', '');
    if (text.length >= 8) {
      return null;
    }
    return 'Invalid password';
  }

  String? chechBoxValidator(bool? value) {
    if (value ?? false) {
      return null;
    }
    return "checkbox required";
  }
}
