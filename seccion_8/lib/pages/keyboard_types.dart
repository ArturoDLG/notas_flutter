//Seccion 8
//lecciones:
//171: Modos de teclado
//ArturoDLG
import 'package:flutter/material.dart';

/*
Cuando usamos TextField, puede que nosotros querramos que el sistema muestre un
tipo de teclado acorde al tipo de dato que deseamos ingresar, para esto contamos
el parametro KeyboardType, el cual recibe el enum TextInputType nombre, con 
diferentes configuraciones de teclado:

* email
* phone
* number
* numberWithOptions: nos permite habilitar decimales y signos.
* name: el teclado por defecto.
* etc.

Si queremos cambiar la accion del teclado, el cual cuenta con un parametro de 
tipo textInputAction, el cual tambien recibe un enum con diferentes acciones que 
podemos hacer como:

* next: pasar al siguiente textField de existir.
* send: enviar el/los dato(s) 
* go: ir a la seccion deseada
* search: buscar lo ingresado
* etc.

Si queremos saber cuando el usario a presionado el boton de accion dl teclado,
podemos usar el callback onSummited, el cual recibe como parametro el texto 
ingresado en el textField y no retorna valor alguno.
*/

class KeyboardTypesPage extends StatelessWidget {
  const KeyboardTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const TextField(
            enabled: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text('Email'),
              //border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              label: Text('Phone'),
              //border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: InputDecoration(
              label: Text('Price'),
              //border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false, //para iOS
            enableSuggestions: false,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Name'),
              //border: OutlineInputBorder(),
            ),
            onSubmitted: (_) {
              print('📤');
            },
          ),
        ],
      ),
    );
  }
}

/*
Nota:
KeyboardType.phone no habilita la opcion de pasar al siguiente campo cuando 
usamos TextInputAction.next.
*/