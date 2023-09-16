// importamos unicamente la clase State

import 'dart:async';

import 'package:flutter/widgets.dart'
    show State, StatefulWidget, WidgetsBinding;

/*
Implementamos un mixin, el cual solamente puede ser aplicado en clases de tipo
State usados en StateFulWidgets.
*/
mixin AfterFirstLayoutMixin<T extends StatefulWidget> on State<T> {
  /*
  Sobreescribimos el metodo initState de State para hacer ejecutar nuestro
  metodo abstracto onAfterFirstLayout, el cual solamente requerira ser 
  implementado en la clase sin necesidad de sobreescribir en esta el
  metodo initState.
  */
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        onAfterFirtsLayout();
      },
    );
  }

  /*
  FutureOr nos permite trabajar si implementamos el Future con el tipo generico
  o simplemente con el tipo generico
  */
  FutureOr<void> onAfterFirtsLayout();
}
