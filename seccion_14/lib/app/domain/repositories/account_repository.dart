import '../models/user.dart';

/// Clase abstracta para implementar la logica de obtener informacion de una
/// cuenta
abstract class AccountRepository {
  /// Metodo para recuperar los datos de un usuario.
  Future<User?> getUserData();
}
