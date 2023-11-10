import '../either/either.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/media/media.dart';
import '../models/user/user.dart';

/// Clase abstracta para implementar la logica de obtener informacion de una
/// cuenta
abstract class AccountRepository {
  /// Metodo para recuperar los datos de un usuario.
  Future<User?> getUserData();

  /// Metodo para obtener los favoritos de un usuario.
  Future<Either<HttpRequestFailure, Map<int, Media>>> getFavorites(
    MediaType type,
  );

  /// Metodo para marcar un media como favorito.
  Future<Either<HttpRequestFailure, void>> markAsFavorite({
    required int mediaId,
    required MediaType type,
    required bool favorite,
  });
}
