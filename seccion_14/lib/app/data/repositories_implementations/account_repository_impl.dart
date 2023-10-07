import '../../domain/models/user.dart';
import '../../domain/repositories/account_repository.dart';
import '../services/local/session_service.dart';
import '../services/remote/account_api.dart';

/// Clase implementadora de la logica de obtener informacion de una cuenta de
/// usuario
class AccountRepositoryImpl implements AccountRepository {
  final AccountApi _accountApi;
  final SessionService _sessionService;

  /// [_accountApi] instancia de la API relacionada las cuentas de usuario.
  ///
  /// [_sessionService] instancia para almacenar la informacion de la cuenta en
  /// el dispositivo.
  AccountRepositoryImpl(
    this._accountApi,
    this._sessionService,
  );

  @override
  Future<User?> getUserData() async {
    return _accountApi.getAccount(
      await _sessionService.sessionId ?? '',
    );
  }
}
