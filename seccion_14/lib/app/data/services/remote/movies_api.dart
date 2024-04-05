import '../../../domain/either/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/movie/movie.dart';
import '../../../domain/models/performer/performer.dart';
import '../../http/http.dart';
import '../local/language_services.dart';
import '../utils/handle_failure.dart';

/// Clase para obtener informacion acerca de las peliculas en la API.
///
/// [_http] Instancia de [Http] para realizar las consultas a la API.
class MoviesAPI {
  final Http _http;
  final LanguageService _languageService;

  MoviesAPI(
    this._http,
    this._languageService,
  );

  /// Metodo para obtener peliculas mediante su ID.
  ///
  /// [id] Identificador de la pelicula representad por un [int].
  ///
  /// Retorna un Future con una instancia de [Either] el cual nos devuelve el
  /// [Movie] correspondiente al id, de lo contrario nos devuelve un
  /// [HttpRequestFailure] con la falla ocurrida.
  Future<Either<HttpRequestFailure, Movie>> getMovieById(int id) async {
    final result = await _http.request(
      '/movie/$id',
      languageCode: _languageService.languageCode,
      onSuccess: (json) {
        return Movie.fromJson(json);
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (movie) => Either.right(movie),
    );
  }

  /// Metodo para recuperar el cast de una pelicula.
  ///
  /// [id] Identificador de la pelicula representad por un [int].
  ///
  /// Retorna un Future con una instancia de [Either] el cual nos devuelve un
  /// [List<Performer>] con el cast participante de la pelicula solicitada,
  /// de lo contrario nos devuelve un [HttpRequestFailure] con la falla ocurrida.
  Future<Either<HttpRequestFailure, List<Performer>>> getCastByMovie(
    int movieId,
  ) async {
    final result = await _http.request(
      '/movie/$movieId/credits',
      languageCode: _languageService.languageCode,
      onSuccess: (json) {
        final list = json['cast'] as List;
        return list
            .where(
              (e) =>
                  e['known_for_department'] == 'Acting' &&
                  e['profile_path'] != null,
            )
            .map(
              (e) => Performer.fromJson(
                {
                  ...e,
                  'known_for': [],
                },
              ),
            )
            .toList();
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (cast) => Either.right(cast),
    );
  }
}
