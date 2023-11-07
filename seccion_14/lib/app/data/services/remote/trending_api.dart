import '../../../domain/either/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/media/media.dart';
import '../../../domain/models/performer/performer.dart';
import '../../../domain/typedefs.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

/// Clase encargada de busqueda de tendencias de peliculas, series y actores
/// en la API.
///
/// [_http] Instancia de [Http] para realizar peticiones en la API.
class TrendingApi {
  final Http _http;

  TrendingApi(this._http);

  /// Método para obtener las peliculas y series en tendencia.
  ///
  /// [timeWindow] instancia del enum [TimeWindow] para establecer el rango de
  /// busqueda de tendencia (por dia o semana).
  ///
  /// El metodo retorna un [Future] de una instancia de [Either], si la busqueda
  /// se realiza correctamente obtendremos un [List<Media>] con las tendencias
  /// del momento, de lo contrario un [HttpRequestFailure] con el error ocurrido.
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(
      TimeWindow timeWindow) async {
    final result = await _http.request(
      '/trending/all/${timeWindow.name}',
      onSuccess: (json) {
        final list = List<Json>.from(
          json['results'],
        );
        return getMediaList(list);
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }

  /// Método para obtener alos actores del momento.
  ///
  /// El metodo retorna un [Future] de una instancia de [Either], si la busqueda
  /// se realiza correctamente obtendremos un [List<Performer>] con los actores
  /// del momento, de lo contrario un [HttpRequestFailure] con el error ocurrido.
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers(
    TimeWindow timeWindow,
  ) async {
    final result = await _http.request(
      '/trending/person/${timeWindow.name}',
      onSuccess: (json) {
        final list = List<Json>.from(
          json['results'],
        );
        return list
            .where(
              (e) =>
                  e['known_for_department'] == 'Acting' &&
                  e['profile_path'] != null,
            )
            .map(
              (e) => Performer.fromJson(e),
            )
            .toList();
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
