import '../../domain/either/either.dart';
import '../../domain/failures/sign_in/sign_in_failure.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../services/local/session_service.dart';
import '../services/remote/account_api.dart';
import '../services/remote/authentication_api.dart';

/// Clase implementadora de la logica de autentificación de sesion
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _authenticationAPI;
  final SessionService _sessionService;
  final AccountApi _accountApi;

  /// [_authenticationAPI] instancia de la API relacionada a la autentificacion
  /// de una sesion
  ///
  /// [_sessionService] instancia para almacenar la informacion de la cuenta en
  /// el dispositivo.
  ///
  /// [_accountApi] instancia de la API relacionada a la autentificacion
  /// de una sesion
  AuthenticationRepositoryImpl(
    this._authenticationAPI,
    this._sessionService,
    this._accountApi,
  );

  /// Getter para detectar una sesion activa en el dispositivo.
  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _sessionService.sessionId;
    return sessionId != null;
  }

  /// Metodo para iniciar una nueva sesion en el dispositivo.
  ///
  /// [username] nombre del usuario representado por un [String].
  ///
  /// [password] contraseña del usuario representado por un [String].
  ///
  /// Se retorna un [Future] con una instancia de [Either], el cual nos devuelve
  /// [User] si el inicio de sesion se llevo exitosamente, de lo contrario
  /// retorna un [SignInFailure] con el fallo correspondiente.
  @override
  Future<Either<SignInFailure, User>> singIn(
    String username,
    String password,
  ) async {
    final requestToken = await _authenticationAPI.createRequestToken();

    return requestToken.when(
      left: (failure) async => Either.left(failure),
      right: (requestToken) async {
        final loginResult = await _authenticationAPI.createSessionWithLogin(
          username: username,
          password: password,
          requestToken: requestToken,
        );

        return loginResult.when(
          left: (failure) async => Either.left(failure),
          right: (newRequestToken) async {
            final sessionResult = await _authenticationAPI.createSession(
              newRequestToken,
            );

            return sessionResult.when(
              left: (failure) async => Either.left(failure),
              right: (sessionId) async {
                await _sessionService.saveSessionId(sessionId);

                final user = await _accountApi.getAccount(sessionId);

                if (user == null) {
                  return Either.left(SignInFailureUnknown());
                }

                return Either.right(user);
              },
            );
          },
        );
      },
    );
  }

  /// Metodo para cerrar la sesion activa en el dispositivo.
  @override
  Future<void> signOut() {
    return _sessionService.signOut();
  }
}
