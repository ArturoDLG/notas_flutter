import '../../../domain/either/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/media/media.dart';
import '../../../domain/models/user/user.dart';
import '../../http/http.dart';
import '../local/language_services.dart';
import '../local/session_service.dart';
import '../utils/handle_failure.dart';

/// Clase para obtener la información de un usuario registrado en la API
///
/// [_http] Instacia de [Http] para hacer una solicitud a la API
///
/// [_sessionService] Instancia de [SessionService] para almacenar datos de la
/// cuenta.
class AccountApi {
  final Http _http;
  final SessionService _sessionService;
  final LanguageService _languageService;
  AccountApi(
    this._http,
    this._sessionService,
    this._languageService,
  );

  /// Metodo para obtener la informacion de un usuario.
  ///
  /// [sessionId] Identificador del usuario
  ///
  /// El metodo retorna una instancia de [User] si existe un usuario registrado
  /// en la API, de lo contrario retorna [null].
  Future<User?> getAccount(String sessionId) async {
    final result = await _http.request(
      '/account',
      queryParameters: {
        'session_id': sessionId,
      },
      onSuccess: (json) {
        return User.fromJson(json);
      },
    );
    return result.when(
      left: (_) => null,
      right: (user) => user,
    );
  }

  /// Metodo para obtener las series y peliculas favoritas de la cuenta.
  ///
  /// [type] Instancia del enum [MediaType] para indicar el tipo de media a
  /// mostrar.
  ///
  /// Retorna un [Future] con una instancia de [Either], el cual nos devuelve un
  /// [Map<int, Media>] donde la clave es el id y Media la serie o pelicula
  /// correspondiente, de lo contrario se devuelve un [HttpRequestFailure] con
  /// la falla sucedida.
  Future<Either<HttpRequestFailure, Map<int, Media>>> getFavorites(
      MediaType type) async {
    final sessionId = await _sessionService.sessionId ?? '';
    final accountId = await _sessionService.accountId;

    final result = await _http.request(
      '/account/$accountId/favorite/${type == MediaType.movie ? 'movies' : 'tv'}',
      queryParameters: {
        'session_id': sessionId,
      },
      languageCode: _languageService.languageCode,
      onSuccess: (json) {
        final list = json['results'] as List;
        // final iterable = list.map(
        //   (e) {
        //     final media = Media.fromJson(e);
        //     return MapEntry(media.id, media);
        //   },
        // );

        //return Map<int, Media>.fromEntries(iterable);
        return {
          for (Media media in list.map(
            (e) => Media.fromJson(
              {
                ...e,
                'media_type': type.name,
              },
            ),
          ))
            media.id: media,
        };
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (value) => Either.right(value),
    );
  }

  /// Metodo para marcar una pelicula/serie como favorito para la cuenta.
  ///
  /// [mediaId] identificador de la pelicula/serie.
  ///
  /// [type] tipo de media indicado por un [MediaType].
  ///
  /// [favorite] valor [bool] para indicar si marcamos o no un contenido como
  /// favorito.
  ///
  /// El metodo retorna un [Future] con una instancia de [Either] el cual
  /// devuelve [void] al realizar la tarea y un [HttpRequestFailure] si falla el
  /// proceso.
  Future<Either<HttpRequestFailure, void>> markAsFavorite({
    required int mediaId,
    required MediaType type,
    required bool favorite,
  }) async {
    final accountId = await _sessionService.accountId;
    final sessionId = await _sessionService.sessionId ?? '';
    final result = await _http.request(
      '/account/$accountId/favorite',
      method: HttpMethod.post,
      queryParameters: {
        'session_id': sessionId,
      },
      body: {
        'media_type': type.name,
        'media_id': mediaId,
        'favorite': favorite,
      },
      onSuccess: (_) => null,
    );

    return result.when(
      left: handleHttpFailure,
      right: (_) => Either.right(null),
    );
  }
}
