import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Clase para modelar la información de un usuario de la app.
///
/// [id] identificador numerico [int] del usuario.
///
/// [username] nombre con el cual se registro el usuario al servicio.
@freezed
class User with _$User {
  const User._(); //usamos un constructor privado para crear funciones personalizadas

  const factory User({
    required int id,
    required String username,

    //
    @JsonKey(
      name: 'avatar',
      fromJson: avatarPathFromJson,
    )
    String? avatarPath,
  }) = _User;

  /// Factory constructor para crear una instancia usuario a partir de un JSON.
  factory User.fromJson(Json json) => _$UserFromJson(json);

  String getFormatted() {
    return '$username $id';
  }
}

/// Metodo para obtener el path de la foto del usuario.
///
/// [json] map donde se encuentra almacenado el path.
///
/// Retorna un [String] con el path de la foto de usuario de existir, de lo
/// contrario devuelve [null].
String? avatarPathFromJson(Json json) {
  return json['tmdb']?['avatar_path'];
}
