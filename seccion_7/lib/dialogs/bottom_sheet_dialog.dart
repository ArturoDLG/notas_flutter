import 'package:flutter/material.dart';

Future<void> showBottomSheetDialog(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    //isScrollControlled: true,
    //backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.elliptical(20, 10),
        topRight: Radius.elliptical(20, 10),
      ),
    ),
    //Este parametro nos permite definir dimensiones maximas para nuestro dialog
    constraints: const BoxConstraints(
      maxWidth: 450,
    ),
    //evitar que se minimice el dialogo con scroll
    enableDrag: false,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Photos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Music'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_camera_front),
            title: const Text('Video'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

/*
Si el contenido dentro de un BottomSheetDialog no cabe en su totalidad en 
pantalla, podemos hacer las siguientes acciones:

* Usar el parametro isScrollableController como true.

*Usar un ListView para renderizar los widgets.
*/