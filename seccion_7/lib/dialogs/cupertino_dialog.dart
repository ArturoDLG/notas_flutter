import 'package:flutter/cupertino.dart';

Future<int> showDialogWithCupertinoStyle(
  BuildContext context, {
  String title = '',
  String content = '',
}) async {
  final result = await showCupertinoDialog<int>(
    context: context,
    barrierDismissible: true,
    builder: (context) => _CupertinoDialogContent(
      title: title,
      content: content,
    ),
  );
  return result ?? 1;
}

class _CupertinoDialogContent extends StatelessWidget {
  final String title;
  final String content;
  const _CupertinoDialogContent({
    //super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context, 1);
          },
        ),
        CupertinoDialogAction(
          child: const Text("I'm bad"),
          onPressed: () {
            Navigator.pop(context, 2);
          },
        ),
        CupertinoDialogAction(
          child: const Text("So so"),
          onPressed: () {
            Navigator.pop(context, 3);
          },
        ),
      ],
    );
  }
}

/*
Nota:
A diferencia de showDialog de Material, showCupertinoDialog tiene como valor por
defecto de barrierDismissible como false.

Cuando definimos varios actions en nuestro CupertinoDialogAction, si estos son 2, 
se mostraran uno a lado del otro, de ser mas, se mostraran como columna.

Cuando usas widgets del paquete cupertino en conjunto con material, no podras 
usar las fuentes personalizadas por defecto, teniendo que forzar el estilo.
*/