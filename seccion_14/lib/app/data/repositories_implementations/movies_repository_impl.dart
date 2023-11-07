import '../../domain/either/either.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/movie/movie.dart';
import '../../domain/models/performer/performer.dart';
import '../../domain/repositories/movies_repository.dart';
import '../services/remote/movies_api.dart';

/// Clase implementadora de la logica para recuperar peliculas.
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesAPI _moviesAPI;

  /// [_moviesAPI] Instancia de [MoviesAPI] para recuperar las peliculas.
  MoviesRepositoryImpl(this._moviesAPI);

  /// Metodo para obtener peliculas mediante su ID.
  ///
  /// [id] Identificador de la pelicula representad por un [int].
  ///
  /// Retorna un Future con una instancia de [Either] el cual nos devuelve el
  /// [Movie] correspondiente al id, de lo contrario nos devuelve un
  /// [HttpRequestFailure] con la falla ocurrida.
  @override
  Future<Either<HttpRequestFailure, Movie>> getMovieById(int id) {
    return _moviesAPI.getMovieById(id);
  }

  /// Metodo para recuperar el cast de una pelicula.
  ///
  /// [id] Identificador de la pelicula representad por un [int].
  ///
  /// Retorna un Future con una instancia de [Either] el cual nos devuelve un
  /// [List<Performer>] con el cast participante de la pelicula solicitada,
  /// de lo contrario nos devuelve un [HttpRequestFailure] con la falla ocurrida.
  @override
  Future<Either<HttpRequestFailure, List<Performer>>> getCastByMovie(
      int movieId) {
    return _moviesAPI.getCastByMovie(movieId);
  }
}
