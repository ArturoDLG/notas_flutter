import 'package:equatable/equatable.dart';

/// Estado de SignInController.
///
/// La clase SignInState nos provee de los estados requeridos para
/// SignInController de manera inmutable.
///
/// [username] nombre de la cuenta del usuario. Por defecto es un [String] vacio
///
/// [password] contraseña para acceso a la cuenta. Por defecto es un [String]
/// vacio
///
/// [fetching] booleano que nos indica que se esta validando las información del
/// usuario. Por defecto es false.
class SignInState extends Equatable {
  final String username, password;
  final bool fetching;

  const SignInState({
    this.username = '',
    this.password = '',
    this.fetching = false,
  });

  /// Matedo para retornar una copia con modificaciones de una instancia de
  /// SignInState.
  ///
  /// Si no se especifica alguno de los parametros [username], [password] y/o
  /// [fetching] se devolvera el valor con el que se instanció originalmente.
  SignInState copyWith({
    String? username,
    String? password,
    bool? fetching,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      fetching: fetching ?? this.fetching,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        fetching,
      ];
}
