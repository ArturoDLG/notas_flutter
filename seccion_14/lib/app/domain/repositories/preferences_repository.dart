///Clase abstracta para implementar el manejo de preferencias de usuario.
abstract class PreferencesRepository {
  /// Getter para obtener la configuracion del modo oscuro.
  bool? get darkMode;

  /// Metodo para modificar el modo oscuro.
  Future<void> setDarkMode(bool darkMode);
}
