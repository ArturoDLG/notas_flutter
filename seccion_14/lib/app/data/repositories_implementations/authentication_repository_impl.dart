import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/either.dart';
import '../../domain/enums.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../services/remote/authentication_api.dart';

const _key = 'sessionId';

/// Clase implementadora de la logica de autentificación de sesion
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _secureStorage;
  final AuthenticationAPI _authenticationAPI;

  AuthenticationRepositoryImpl(
    this._secureStorage,
    this._authenticationAPI,
  );

  @override
  Future<User?> getUserData() {
    return Future.value(
      User(),
    );
  }

  @override
  Future<bool> get isSignedIn async {
    final sessionID = await _secureStorage.read(key: _key);
    return sessionID != null;
  }

  @override
  Future<Either<SingInFailure, User>> singIn(
    String username,
    String password,
  ) async {
    final requestToken = await _authenticationAPI.createRequestToken();

    return requestToken.when(
      (failure) async => Either.left(failure),
      (requestToken) async {
        final loginResult = await _authenticationAPI.createSessionWithLogin(
          username: username,
          password: password,
          requestToken: requestToken,
        );

        return loginResult.when(
          (failure) async => Either.left(failure),
          (newRequestToken) async {
            final sessionResult = await _authenticationAPI.createSession(
              newRequestToken,
            );

            return sessionResult.when(
              (failure) async => Either.left(failure),
              (sessionID) async {
                await _secureStorage.write(
                  key: _key,
                  value: sessionID,
                );
                return Either.right(
                  User(),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<void> signOut() {
    return _secureStorage.delete(key: _key);
  }
}
