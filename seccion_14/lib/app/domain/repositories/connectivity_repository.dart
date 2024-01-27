/// Clase abstracta para implementar la logica de conexion a internet de la app
abstract class ConnectivityRepository {
  /// Getter para indicar si hay conexión a internet.
  Future<void> initialize();
  bool get hasInternet;
  Stream<bool> get onInternetChanged;
}
