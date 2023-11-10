import '../either/either.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/movie/movie.dart';
import '../models/performer/performer.dart';

/// Clase abstracta para implementar la logica de datos de pelicula.
abstract class MoviesRepository {
  /// Metodo para obtener una pelicula mediante su ID.
  Future<Either<HttpRequestFailure, Movie>> getMovieById(int id);

  /// Metodo para obtener el cast de una pelicula.
  Future<Either<HttpRequestFailure, List<Performer>>> getCastByMovie(
      int movieId);
}
