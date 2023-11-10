import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/enums.dart';
import '../../domain/repositories/preferences_repository.dart';

/// Clase para implementar la logica de guardado de preferencias de usuario en
/// la app.
class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences _preferences;

  /// [_preferences] Instancia de la clase [SharedPreferences] para almacenar
  /// las preferencias de usuario.
  PreferencesRepositoryImpl(this._preferences);

  /// Getter para obtener si el modo oscuro esta activado en la app.
  @override
  bool? get darkMode {
    return _preferences.getBool(Preference.darkMode.name);
  }

  /// Metodo para cambiar la configuracion del modo oscuro de la app.
  ///
  /// [darkMode] valor [bool] para indicar si se activa o desactiva el modo
  /// oscuro.
  @override
  Future<void> setDarkMode(bool darkMode) {
    return _preferences.setBool(
      Preference.darkMode.name,
      darkMode,
    );
  }
}
