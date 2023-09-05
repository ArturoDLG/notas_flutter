import 'package:flutter/material.dart';

/*
Al igual que con los pages, podemos retornar valores utilizando el parametro 
opcional de Navigator.pop.
*/

Future<bool> showConfirmDialog(
  BuildContext context, {
  String title = '',
}) async {
  final result = await showDialog<bool>(
    context: context,
    //fondo de pantalla donde aparece el dialog
    barrierColor: Colors.white.withOpacity(.6),
    //evitar que el dialogo se cierra al presionar fuera del dialog
    barrierDismissible: false,
    builder: (context) => _DialogContent(
      title: title,
    ),
  );
  return result ?? false;
}

class _DialogContent extends StatelessWidget {
  final String title;
  const _DialogContent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      //alinear dialog respecto a la pantalla
      alignment: Alignment.topCenter,
      //sombra
      elevation: 0,
      //color de fondo del dialog
      backgroundColor: Colors.blue[50],

      //forma del dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        MaterialButton(
          child: const Text(
            'YES',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        MaterialButton(
          child: const Text(
            'NO',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

/*
Nota: 
En Android es posible minimizar un dialogo presionando el boton atras, aunque se 
indique en el parametro barrierDismissible como false.
*/