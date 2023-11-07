import '../either/either.dart';
import '../failures/sign_in/sign_in_failure.dart';
import '../models/user/user.dart';

/// Clase abstracta para implementar la logica de inicio de sesion
abstract class AuthenticationRepository {
  /// Getter para indicar si hay un inicio de seccion activo.
  Future<bool> get isSignedIn;

  /// Metodo para iniciar una sesión.
  Future<Either<SignInFailure, User>> singIn(
    String username,
    String password,
  );

  /// Metodo para cerrar una sesión activa.
  Future<void> signOut();
}
