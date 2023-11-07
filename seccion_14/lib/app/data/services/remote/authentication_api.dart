import '../../../domain/either/either.dart';
import '../../../domain/failures/sign_in/sign_in_failure.dart';
import '../../http/http.dart';

/// Clase encargada para la autentificación en la API de themoviedb.
///
/// AuthenticationAPI se encarga de iniciar una sesión en themoviedb.org
///
/// [_http] La instancia de Http nos permite realizar la petición para el inicio
/// de sesión.
///
/// Para tener una sesion activa en themoviedb.org requiere de 3 pasos:
///
/// * Crear un requestToken: solicitamos un token para iniciar la sesion
/// * Crear una sesion con login: solicitamos un nuevo token usando el anterior
///   y el login del usuario que desea iniciar sesion.
/// * Crear una sesion: usando el token anterior, creamos el sessionId para
///   mantener la sesion activa.
class AuthenticationAPI {
  final Http _http;
  AuthenticationAPI(this._http);

  /// Metodo para manejar de manera sencilla a todos los posibles errores.
  ///
  /// [failure] Recibe una instancia de [HttpFailure] el cual nos indicará si
  /// sucedió un error en la petición, de conexión o un error desconocido.
  ///
  /// El metodo retorna un [Either] con el [SignInFailure] correspondiente al
  /// error recibido.
  Either<SignInFailure, String> _handleFailure(HttpFailure failure) {
    if (failure.statusCode != null) {
      return switch (failure.statusCode!) {
        401 => _handle401Error(failure),
        404 => Either.left(SignInFailureNotFound()),
        _ => Either.left(SignInFailureUnknown()),
      };
    }

    if (failure.exception is NetworkException) {
      return Either.left(SignInFailureNetwork());
    }
    return Either.left(SignInFailureUnknown());
  }

  /// Metodo para solicitar un requestToken.
  ///
  /// Devuelve un [Either] con un [String] con el requestToken si la petición
  /// funciona o un [SignInFailure] si sucede un error.
  Future<Either<SignInFailure, String>> createRequestToken() async {
    final result = await _http.request(
      '/authentication/token/new',
      onSuccess: (responseBody) {
        final json = responseBody as Map;

        return json['request_token'] as String;
      },
    );
    return result.when(
      left: _handleFailure,
      right: (requestToken) => Either.right(requestToken),
    );
  }

  /// Metodo para solicitar un requestToken mediante un login.
  ///
  /// [username] recibe un string con el nombre del usuario.
  /// [password] recibe un string con el password del usuario.
  /// [requestToken] recibe el token de [createRequestToken]
  ///
  /// Devuelve un [Either] con un [String] con el nuevo requestToken si la
  /// petición funciona o un [SignInFailure] si sucede un error.
  Future<Either<SignInFailure, String>> createSessionWithLogin({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final result = await _http.request(
      '/authentication/token/validate_with_login',
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['request_token'] as String;
      },
      method: HttpMethod.post,
      body: {
        'username': username,
        'password': password,
        'request_token': requestToken,
      },
    );

    return result.when(
      left: _handleFailure,
      right: (newRequestToken) => Either.right(newRequestToken),
    );
  }

  /// Metodo para solicitar el sessionId que mantendra activa la sesion en el
  /// dispositivo.
  ///
  /// [requestToken] recibimos un String con el token de [createSessionWithLogin]
  ///
  /// Devuelve un [Either] con un [String] con el sessionId si la petición
  /// funciona o un [SignInFailure] si sucede un error.
  Future<Either<SignInFailure, String>> createSession(
    String requestToken,
  ) async {
    final result = await _http.request(
      '/authentication/session/new',
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['session_id'] as String;
      },
      method: HttpMethod.post,
      body: {
        'request_token': requestToken,
      },
    );
    return result.when(
      left: _handleFailure,
      right: (sessionID) => Either.right(sessionID),
    );
  }

  /// Metodo para manejar los diferentes tipos de error 401 de la API de
  /// autentificación.
  ///
  /// [failure] Instancia de [HttpFailure] con el error sucedido.
  ///
  /// El metodo retorna un [Either] con un [SignInFailureNotVerified] si el
  /// error 401 fue causado por correo no verificado, de lo contrario el error
  /// sera un [SignInFailureUnauthorized].
  Either<SignInFailure, String> _handle401Error(HttpFailure failure) {
    if (failure.data is Map && (failure.data as Map)['status_code'] == 32) {
      return Either.left(SignInFailureNotVerified());
    }
    return Either.left(SignInFailureUnauthorized());
  }
}
