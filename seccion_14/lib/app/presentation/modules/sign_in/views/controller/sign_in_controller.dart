import 'package:flutter/foundation.dart';

import '../../widgets/submit_button.dart';
import '../sign_in_view.dart';

/// Controlador de la logica de la vista [SignInView]
class SignInController extends ChangeNotifier {
  String _username = '', _password = '';
  bool _fetching = false, _mounted = true;

  /// Getter para obtener el nombre de usuario.
  String get username => _username;

  /// Getter para obtener el password del usuario.
  String get password => _password;

  /// Getter para indicar el cambio de widget en [SubmitButton]
  bool get fetching => _fetching;

  /// Getter para indicar si el widget sigue renderizado
  bool get mounted => _mounted;

  /// Metodo para modificar el nombre de usuario, removiendo espacios en blanco
  /// y convertir a minusculas los caracteres.
  ///
  /// [String] recibe el texto ingresado por el usuario
  void onUsernameChanged(String text) {
    _username = text.trim().toLowerCase();
  }

  /// Metodo para modificar el password de usuario, removiendo espacios en blanco.
  ///
  /// [String] recibe el texto ingresado por el usuario
  void onPasswordChanged(String text) {
    _password = text.replaceAll(' ', '');
  }

  /// Metodo para cambiar el valor de [_fetching], el cual se encarga de cambiar
  /// el widget mostrado por [SubmitButton]
  ///
  /// [value] recibe un [bool] para indicar el cambio de widget.
  void onFetchingChanged(bool value) {
    _fetching = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
