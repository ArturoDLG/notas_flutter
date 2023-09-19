import 'package:flutter/foundation.dart';

typedef VoidCallback = void Function();

/// Clase para notificar cambios en la app
abstract class ProviderNotifier {
  /// Lista de oyentes de los cambios de la app
  final List<VoidCallback> _listeners = [];

  /// Agregar oyentes al Provider
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  /// Remover oyentes cuando el widget se destruya
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  /// Notificar de los cambios a los widgets suscritos
  @protected
  void notify() {
    for (final listener in _listeners) {
      listener();
    }
  }

  @protected
  @mustCallSuper
  void dispose() {
    _listeners.clear();
  }
}
