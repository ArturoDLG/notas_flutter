import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

/// Clase para reprensetar el/los genero(s) de la [Media]
///
/// [id] identificador numerico [int] del genero.
///
/// [name] nombre del genero.

@freezed
class Genre with _$Genre {
  factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
