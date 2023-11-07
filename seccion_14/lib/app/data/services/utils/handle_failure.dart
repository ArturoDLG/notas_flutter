import '../../../domain/either/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../http/http.dart';

/// Funcion para manejar los errores al llamar a la API
Either<HttpRequestFailure, R> handleHttpFailure<R>(HttpFailure httpFailure) {
  final failure = () {
    final statusCode = httpFailure.statusCode;
    switch (statusCode) {
      case 401:
        return HttpRequestFailureUnauthorized();
      case 404:
        return HttpRequestFailureNotFound();
    }

    if (httpFailure.exception is NetworkException) {
      return HttpRequestFailureNetwork();
    }
    return HttpRequestFailureUnknown();
  }();

  return Either.left(failure);
}
