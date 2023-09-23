//Seccion 12
//Lecciones:
//225 - 226.- Campos personalizdos
import 'package:flutter/material.dart';

/*
Actualmente Flutter solo cuenta con TextFormField como un widget que cuenta con
las caracteristicas de los widgets Form, por lo cual, si queremos tener widgets 
en nuestro Form que sean diferentes a un TextField (como ChechBox, Switch,etc)
tendremos que crear nuestro widget personalizado.

Para hacer esto deberemos de crear una clase que extienda de FormField (el cual
recibe un tipo generico, que sera el dato que queremos recibir en el widget) y 
sobreescribir el constructor super() para poder crear nuestro widget.
*/

class LoginCheckBox extends FormField<bool> {
  LoginCheckBox({
    super.key,
    bool? initialValue,
    AutovalidateMode? autovalidateMode,
    String? Function(bool?)? validator,
    required void Function(bool value) onChanged,
  }) : super(
            autovalidateMode: autovalidateMode,
            validator: validator,
            initialValue: initialValue,
            builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    value: state.value ?? false,
                    title: const Text('hello world'),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      state.didChange(value);
                      if (value != null) {
                        onChanged(value);
                      }
                    },
                  ),
                  if (state.hasError)
                    Text(
                      state.errorText!,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              );
            });
}
