import '../../../domain/models/user/user.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../state_notifier.dart';

/// Clase para manejar los datos de sesion del usuario
class SessionController extends StateNotifier<User?> {
  final AuthenticationRepository authenticationRepository;
  SessionController({
    required this.authenticationRepository,
  }) : super(null);

  /// Actualizar los datos del usuario
  void setUser(User user) {
    state = user;
  }

  /// Cerrar sesion del usuario
  Future<void> signOut() async {
    await authenticationRepository.signOut();
    onlyUpdate(null);
  }
}
