import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'media.freezed.dart';
part 'media.g.dart';

///Enum para los tipos de multimedia
enum MediaType {
  @JsonValue('movie')
  movie,
  @JsonValue('tv')
  tv,
}

/// Clase para representar a las peliculas y series de la API.
///
/// [id] entero identificador de la media.
///
/// [overview] descripción de la pelicula/serie.
///
/// [title] titulo de la pelicula/serie (en el idioma seleccionado por el usuario).
///
/// [originalTitle] titulo de la pelicula/serie en su idioma original.
///
/// [posterPath] url de la imagen del poster de la pelicula/serie.
///
/// [backdropPath] url de la imagen backdrop.
///
/// [voteAverage] promedio de la aprobación de la pelicula/serie.
///
/// [type] tipo de media.
@freezed
class Media with _$Media {
  factory Media({
    required int id,
    required String overview,
    //
    @JsonKey(readValue: readTitleValue) required String title,
    @JsonKey(
      name: 'original_title',
      readValue: readOriginalTitleValue,
    )
    required String originalTitle,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'media_type') required MediaType type,
  }) = _Media;

  factory Media.fromJson(Json json) => _$MediaFromJson(json);
}

/// Metodo para obtener el titulo de la pelicula mediante la clave 'title' o
/// 'name'.
///
/// [map] objeto Json retornado por la API.
///
/// El metodo retorna un [Object] si existe las claves 'title' o 'name', de lo
/// contrario retorna [null].
Object? readTitleValue(Map map, String _) {
  return map['title'] ?? map['name'];
}

/// Metodo para obtener el titulo original de la pelicula mediante la clave
/// 'original_title' o 'original_name'.
///
/// [map] objeto Json retornado por la API.
///
/// El metodo retorna un [Object] si existe las claves 'original_title' o
/// 'original_name', de lo contrario retorna [null].
Object? readOriginalTitleValue(Map map, String _) {
  return map['original_title'] ?? map['original_name'];
}

/// Metodo para obtener una lista de [Media]
List<Media> getMediaList(List list) {
  return list
      .where(
        (e) =>
            e['media_type'] != 'person' &&
            e['poster_path'] != null &&
            e['backdrop_path'] != null,
      )
      .map(
        (item) => Media.fromJson(item),
      )
      .toList();
}
