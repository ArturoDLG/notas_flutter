import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

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

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String username,
    @Default('') String password,
    @Default(false) bool fetching,
  }) = _SignInState;
}
