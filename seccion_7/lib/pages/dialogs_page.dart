//Seccion 7
//lecciones:
//154 - 160: Dialogos
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_7/dialogs/confirm_dialog.dart';

/*
Los dialogos son un tipo de widget que nos permite mostrar un mensaje encima de 
la app al usuario, para informarle de errores que haya cometido o sucedido en la 
app, confirmar una accion o avisarle que un proceso se ha cumplido exitosamente.
*/

class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('show info dialog'),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => const DialogContent(),
              );
              print('⌛');
            },
          ),
          ListTile(
            title: const Text('show confirm dialog'),
            onTap: () async {
              final isOK = await showConfirmDialog(
                context,
                title: 'Are you sure?',
              );
              print('is Ok $isOK');
            },
          )
        ],
      ),
    );
  }
}

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('My dialog'),
      actions: [
        MaterialButton(
          child: const Text('OK 👍🏻'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

/*
Nota:
El hot reload solo funciona con aquellos widgets que extienden de 
StatelessWidget/StatefulWidget, por lo que para ver los cambios en un Dialog o 
similares, bastará con envolverlos en una clase que extienda de estos.

Al igual que con los pages, podemos navegar con los Dialogs utilizando Navigator,
e incluso usarlos de manera asincorna con asyn y await.
*/
