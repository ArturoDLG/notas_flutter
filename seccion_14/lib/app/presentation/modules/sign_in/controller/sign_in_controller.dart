import '../../../../domain/either/either.dart';
import '../../../../domain/failures/sign_in/sign_in_failure.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../global/controller/favorites/favorites_controller.dart';
import '../../../global/controller/session_controller.dart';
import '../../../global/state_notifier.dart';
import 'state/sign_in_state.dart';

/// Controlador de la logica de la vista [SignInView]
///
/// [state] instancia del estado para el controlador
///
/// [authenticationRepository] instancia de la clase para llamar a la API
/// encargada del inicio de sesión.
class SignInController extends StateNotifier<SignInState> {
  final AuthenticationRepository authenticationRepository;
  final SessionController sessionController;
  final FavoritesController favoritesController;
  SignInController(
    super.state, {
    required this.authenticationRepository,
    required this.sessionController,
    required this.favoritesController,
  });

  /// Metodo para modificar el nombre de usuario, removiendo espacios en blanco
  /// y convertir a minusculas los caracteres.
  ///
  /// [String] recibe el texto ingresado por el usuario
  void onUsernameChanged(String text) {
    onlyUpdate(
      state.copyWith(
        username: text.trim().toLowerCase(),
      ),
    );
  }

  /// Metodo para modificar el password de usuario, removiendo espacios en blanco.
  ///
  /// [String] recibe el texto ingresado por el usuario
  void onPasswordChanged(String text) {
    onlyUpdate(
      state.copyWith(
        password: text.replaceAll(' ', ''),
      ),
    );
  }

  /// Metodo para cambiar el valor de [_fetching], el cual se encarga de cambiar
  /// el widget mostrado por [SubmitButton]
  ///
  /// [value] recibe un [bool] para indicar el cambio de widget.
  Future<Either<SignInFailure, User>> submit() async {
    state = state.copyWith(fetching: true);
    final result = await authenticationRepository.singIn(
      state.username,
      state.password,
    );

    result.when(
      left: (_) => state = state.copyWith(fetching: false),
      right: (user) {
        sessionController.setUser(user);
        favoritesController.init();
      },
    );

    return result;
  }
}
