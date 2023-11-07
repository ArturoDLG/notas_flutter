import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

/// Clase para manejar un posible tipo de retorno de 2 opciones mediante
/// programación funcional.
///
/// [_left] y [_right] son los posibles datos a manejar, ambos son nullables y
/// se espera que haya algun dato en alguno de los parametros.
@freezed
class Either<L, R> with _$Either<L, R> {
  factory Either.left(L value) = Left;
  factory Either.right(R value) = Right;
}
