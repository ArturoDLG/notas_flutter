import 'package:flutter/foundation.dart';

/// Clase abstracta para notificar cambios en el estado de un controlador
/// a Provider
///
/// [_state] instancia de una clase que contenga el estado a manejar con Provider.
abstract class StateNotifier<State> extends ChangeNotifier {
  // propiedad encargada del estado del controlador
  State _state, _oldState;

  // propiedad para indicar si el widget SignInView sigue renderizado
  bool _mounted = true;

  StateNotifier(this._state) : _oldState = _state;

  /// Getter para conocer el estado del controller
  State get state => _state;

  ///Gettter para conocer el estado anterior del controller
  State get oldState => _oldState;

  /// Getter para indicar si el widget sigue renderizado
  bool get mounted => _mounted;

  /// Setter para modificar el [State]
  set state(State newState) {
    _update(newState);
  }

  void onlyUpdate(State newState) {
    _update(newState, notify: false);
  }

  void _update(
    State newState, {
    bool notify = true,
  }) {
    if (_state != newState) {
      _oldState = _state;
      _state = newState;
      if (notify) {
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
