/// Clase para manejar un posible tipo de retorno de 2 opciones mediante
/// programación funcional.
///
/// [_left] y [_right] son los posibles datos a manejar, ambos son nullables y
/// se espera que haya algun dato en alguno de los parametros.
class Either<Left, Right> {
  final Left? _left;
  final Right? _right;
  final bool isLeft;

  Either._(
    this._left,
    this._right,
    this.isLeft,
  );

  /// Factory constructor para agregar el valor en left.
  factory Either.left(Left failure) {
    return Either._(failure, null, true);
  }

  /// Factory constructor para agregar el valor en right.
  factory Either.right(Right value) {
    return Either._(null, value, false);
  }

  /// Metodo que retorna un tipo generico T dependiendo si hay valor en [_left]
  /// o en [_right].
  ///
  /// [left], [right] reciben un callback el cual se ejecuta dependiendo de cual
  /// dato no es nulo.
  T when<T>(
    T Function(Left) left,
    T Function(Right) right,
  ) {
    if (isLeft) {
      return left(_left as Left);
    } else {
      return right(_right as Right);
    }
  }
}
