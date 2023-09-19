//Seccion 11
//Lecciones:
//215 - 218.- Custom state managemet
//Arturo DLG
import 'package:flutter/material.dart';
import 'package:seccion_11/state_management/notifier.dart';

/* 
Mediante el uso de InheritedWidgets, podemos crear un Gestor de estados, como 
paquetes populares como Provider. Para este ejemplo usaremos las siguientes 
clases:

* ProviderNotifier: Clase abstracta encargada de gestionar a los widgets oyentes
de los cambios que se realicen en la app. (Vease notifier.dart)

* Provider: StateFulWidget que se encarga de envolver a el widget que va a 
renderizar los cambios a escuchar, este recibe un dato generico que extiende de
ProviderNotifier.

* Consumer: StateFulWidget que se encarga de envolver a el widget que notifica
que se ha realizado un cambio. 

*/

class Provider<T extends ProviderNotifier> extends StatefulWidget {
  final Widget child;
  final T Function() create;
  const Provider({
    super.key,
    required this.child,
    required this.create,
  });

  @override
  State<Provider<T>> createState() => _ProviderState<T>();

  /// Metodo estatico que nos da acceso a ProviderNotifier a los widgets hijos
  /// mediante el uso del contexto.
  static T of<T extends ProviderNotifier>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_InheritedWidget<T>>();
    assert(provider != null);
    return provider!.notifier;
  }
}

class _ProviderState<T extends ProviderNotifier> extends State<Provider<T>> {
  late final T _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = widget.create();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedWidget<T>(
      notifier: _notifier,
      child: widget.child,
    );
  }
}

class _InheritedWidget<T extends ProviderNotifier> extends InheritedWidget {
  final T notifier;
  const _InheritedWidget({
    Key? key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(_) {
    return false;
  }
}
