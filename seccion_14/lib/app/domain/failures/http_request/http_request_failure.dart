import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_failure.freezed.dart';

/// Clase para representar errores de una petición a la API.
@freezed
class HttpRequestFailure with _$HttpRequestFailure {
  /// Error de busqueda no encontrada
  factory HttpRequestFailure.notFound() = HttpRequestFailureNotFound;

  /// Error de red
  factory HttpRequestFailure.network() = HttpRequestFailureNetwork;

  /// Error de busqueda no autorizada
  factory HttpRequestFailure.unauthorized() = HttpRequestFailureUnauthorized;

  /// Error desconocido
  factory HttpRequestFailure.unknown() = HttpRequestFailureUnknown;
}
