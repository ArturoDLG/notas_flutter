import 'package:flutter/material.dart';

Future<void> showCustomDialog(
  BuildContext context, {
  bool dismissible = true,
}) {
  return showDialog(
    context: context,
    //Tambien podemos usar WillPopScope para evitar que nuestro dialogo sea
    //minimizado al presionar fuera de el o con el boton de retorceso de Android.
    builder: (context) => WillPopScope(
      //Una mejor manera de escribir la funcio que retorna el Future es la siguiente:
      onWillPop: () async => dismissible,
      child: const _CustomDialog(),
    ),
  );
}

class _CustomDialog extends StatelessWidget {
  const _CustomDialog();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          width: 360,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Text(
                'Congratulations',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              const Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.green,
                size: 100,
              ),
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
