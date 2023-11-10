import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../genre/genre.dart';
import '../media/media.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

/// Clase para modelar los datos de una pelicula.
///
/// [id] identificador de la pelicula.
///
/// [genres] un [List] de [Genre] con los generos de la pelicula.
///
/// [overview] descripcion de la pelicula.
///
/// [runtime] tiempo de duracion de la pelicula.
///
/// [title] titulo de la pelicula en el idioma que el usuario ha configurado la
/// cuenta.
///
/// [originalTitle] titulo de la pelicula en el idioma original de la pelicula.
///
/// [backdropPath] url de la imagen de fondo de la pelicula, puede ser nulo.
///
/// [posterPath] url del poster de promocion de la pelicula.
///
/// [voteAverage] promedio de calificacion dada por los usuarios.
///
/// [realeseDate] fecha de estreno de la pelicula.

@freezed
class Movie with _$Movie {
  const Movie._();
  const factory Movie({
    required int id,
    required List<Genre> genres,
    required String overview,
    required int runtime,

    //
    @JsonKey(readValue: readTitleValue) required String title,
    @JsonKey(
      name: 'original_title',
      readValue: readOriginalTitleValue,
    )
    required String originalTitle,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'release_date') required DateTime realeseDate,
  }) = _Movie;

  factory Movie.fromJson(Json json) => _$MovieFromJson(json);

  Media toMedia() {
    return Media(
      id: id,
      overview: overview,
      title: title,
      originalTitle: originalTitle,
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      type: MediaType.movie,
    );
  }
}
