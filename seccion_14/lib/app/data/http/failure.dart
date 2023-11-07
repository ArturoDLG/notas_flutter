part of 'http.dart';

/// Manejador de errores para las peticiones a la API.
///
/// HttpFailure nos permite indicar que una petición a la API ha fallado durante
/// el tiempo de ejecucion.
///
/// [statusCode] nos indica que la petición pudo ser realizada, pero no se hizo
/// de manera correcta, recibiendo el codigo de error.
///
/// [exception] nos indica que ha ocurrido un error que impidió realizar la
/// petición.
class HttpFailure {
  final int? statusCode;
  final Object? exception;
  final Object? data;

  HttpFailure({
    this.statusCode,
    this.exception,
    this.data,
  });
}

/// Error personalizado para indicar una falla de conexión a internet
/// [SocketException, ClientException] ocurrido en tiempo de ejecución tanto en
/// la version web como mobile y/o desktop.
class NetworkException {}
