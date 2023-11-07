import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_failure.freezed.dart';

/// Clase para manejar errores durante el inicio de sesion.
@freezed
sealed class SignInFailure with _$SignInFailure {
  /// Error de red
  factory SignInFailure.network() = SignInFailureNetwork;

  /// Error de usuario no encontrado
  factory SignInFailure.notFound() = SignInFailureNotFound;

  /// Error de no autorizacion
  factory SignInFailure.unauthorized() = SignInFailureUnauthorized;

  /// Error desconocido
  factory SignInFailure.unknown() = SignInFailureUnknown;

  /// Usuario no verificado
  factory SignInFailure.notVerified() = SignInFailureNotVerified;
}
