import 'package:flutter/widgets.dart' show GlobalKey, StatelessWidget;

/*
MountedMixin es un Mixin que nos permite saber si nuestro StateLessWidget aun 
forma parte del arbol de widgets de la app a traves de un GlobalKey.

Como recomendacion de optimizacion, hay que usar el widgetKey dentro de un 
StateLessWidget.
*/
mixin MountedMixin on StatelessWidget {
  final widgetKey = GlobalKey();

  bool get mounted {
    return widgetKey.currentContext != null;
  }
}
