import '../../domain/either/either.dart';
import '../../domain/enums.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/media/media.dart';
import '../../domain/models/performer/performer.dart';
import '../../domain/repositories/trending_repository.dart';
import '../services/remote/trending_api.dart';

/// Clase implementadora de la logica que recupera peliculas, series y actores
/// de la API (que sean trending).
class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingApi _trendingApi;

  /// [_trendingApi] Instancia de la API para buscar trendings de peliculas,
  /// series y actores.
  TrendingRepositoryImpl(this._trendingApi);

  /// Método para obtener las peliculas y series en tendencia.
  ///
  /// [timeWindow] instancia del enum [TimeWindow] para establecer el rango de
  /// busqueda de tendencia (por dia o semana).
  ///
  /// El metodo retorna un [Future] de una instancia de [Either], si la busqueda
  /// se realiza correctamente obtendremos un [List<Media>] con las tendencias
  /// del momento, de lo contrario un [HttpRequestFailure] con el error ocurrido.
  @override
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
      TimeWindow timeWindow) {
    return _trendingApi.getMoviesAndSeries(timeWindow);
  }

  /// Método para obtener alos actores del momento.
  ///
  /// El metodo retorna un [Future] de una instancia de [Either], si la busqueda
  /// se realiza correctamente obtendremos un [List<Performer>] con los actores
  /// del momento, de lo contrario un [HttpRequestFailure] con el error ocurrido.
  @override
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers() {
    return _trendingApi.getPerformers(TimeWindow.day);
  }
}
