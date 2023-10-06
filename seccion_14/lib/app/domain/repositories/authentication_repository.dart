import '../either.dart';
import '../enums.dart';
import '../models/user.dart';

/// Clase abstracta para implementar la logica de inicio de sesion
abstract class AuthenticationRepository {
  /// Getter para indicar si hay un inicio de seccion activo.
  Future<bool> get isSignedIn;

  /// Metodo para recuperar los datos de un usuario.
  Future<User?> getUserData();

  /// Metodo para iniciar una sesión.
  Future<Either<SingInFailure, User>> singIn(
    String username,
    String password,
  );

  /// Metodo para cerrar una sesión activa.
  Future<void> signOut();
}
