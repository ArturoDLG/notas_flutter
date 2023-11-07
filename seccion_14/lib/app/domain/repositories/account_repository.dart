import '../either/either.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/media/media.dart';
import '../models/user/user.dart';

/// Clase abstracta para implementar la logica de obtener informacion de una
/// cuenta
abstract class AccountRepository {
  /// Metodo para recuperar los datos de un usuario.
  Future<User?> getUserData();
  Future<Either<HttpRequestFailure, Map<int, Media>>> getFavorites(
    MediaType type,
  );
}
