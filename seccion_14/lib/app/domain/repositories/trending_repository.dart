import '../either/either.dart';
import '../enums.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/media/media.dart';
import '../models/performer/performer.dart';

/// Clase abstracta para implementar la logica de tendencias de la API.
abstract class TrendingRepository {
  /// Metodo para obtener una [List<Media>] en tendencia en un rango de tiempo
  /// [TimeWindow].
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
      TimeWindow timeWindow);

  /// Metodo para obtener una [List<Performer>] en tendencia en el dia.
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers();
}
