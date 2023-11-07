import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _key = 'sessionId';
const _accountKey = 'accountId';

/// Clase encargada de gestionar una sesión de usuario en el dispositivo.
///
/// [_secureStorage] instancia de [FlutterSecureStorage] para almacenar el
/// sessionId del usuario.
class SessionService {
  final FlutterSecureStorage _secureStorage;

  SessionService(this._secureStorage);

  /// Getter para obtener un ID de inicio de sesión almacenada en el dispositivo.
  Future<String?> get sessionId async {
    return _secureStorage.read(key: _key);
  }

  /// Getter para recuperar el ID de la cuenta relacionada al inicio de sesion.
  Future<String?> get accountId async {
    return _secureStorage.read(key: _key);
  }

  /// Metodo para almacenar una nueva sesión en el dispositivo.
  ///
  /// [sessionId] identificador del inicio de sesión.
  Future<void> saveSessionId(String sessionId) {
    return _secureStorage.write(
      key: _key,
      value: sessionId,
    );
  }

  /// Metodo para almacenar el ID de la cuenta relacionada a la sesion.
  ///
  /// [accountId] identificador de la cuenta.
  Future<void> saveAccountId(String accountId) {
    return _secureStorage.write(
      key: _accountKey,
      value: accountId,
    );
  }

  /// Metodo para cerrar una sesión en el dispositivo.
  Future<void> signOut() async {
    return _secureStorage.deleteAll();
  }
}
