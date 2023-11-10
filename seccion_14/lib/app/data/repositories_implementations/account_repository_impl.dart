import '../../domain/either/either.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/media/media.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/account_repository.dart';
import '../services/local/session_service.dart';
import '../services/remote/account_api.dart';

/// Clase implementadora de la logica de obtener informacion de una cuenta de
/// usuario.
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

  /// Metodo para obtener la información de un usuario con sesión en el
  /// dispositivo. Si hay una sesión en el dispositivo se retorna un [Future] de
  /// [User], de lo contrario retorna [null].
  @override
  Future<User?> getUserData() async {
    final user = await _accountApi.getAccount(
      await _sessionService.sessionId ?? '',
    );

    if (user != null) {
      await _sessionService.saveAccountId(
        user.id.toString(),
      );
    }
    return user;
  }

  /// Metodo para obtener las series/peliculas favoritas seleccionadas por el
  /// usuario.
  ///
  /// [type] recibe un enum [MediaType] para indicar el tipo de media que va
  /// a mostrar (serie o pelicula).
  ///
  /// Retorna un [Future] con una instancia de [Either], si la consulta se
  /// realiza correctamente, devolvera un [Map<int, Media>] con el indice y la
  /// media correspondiente, de lo contrario devolvera el [HttpRequestFailure]
  /// correspondiente.
  @override
  Future<Either<HttpRequestFailure, Map<int, Media>>> getFavorites(
      MediaType type) {
    return _accountApi.getFavorites(type);
  }

  /// Metodo para marcar una pelicula/serie como favorito para la cuenta.
  ///
  /// [mediaId] identificador de la pelicula/serie.
  ///
  /// [type] tipo de media indicado por un [MediaType].
  ///
  /// [favorite] valor [bool] para indicar si marcamos o no un contenido como
  /// favorito.
  ///
  /// El metodo retorna un [Future] con una instancia de [Either] el cual
  /// devuelve [void] al realizar la tarea y un [HttpRequestFailure] si falla el
  /// proceso.
  @override
  Future<Either<HttpRequestFailure, void>> markAsFavorite({
    required int mediaId,
    required MediaType type,
    required bool favorite,
  }) {
    return _accountApi.markAsFavorite(
      mediaId: mediaId,
      type: type,
      favorite: favorite,
    );
  }
}
