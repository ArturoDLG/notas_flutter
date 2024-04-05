import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../domain/either/either.dart';

part 'failure.dart';
part 'logs.dart';
part 'parse_response_body.dart';

/// Clase para realizar peticiones a una API
///
/// Http nos permite realizar cualquier tipo de petición a una API usando un
/// método de manera sencilla.
///
/// [_baseUrl] recibe la URL base de la API a utilizar por ejemplo:
/// https://api.example.com/
///
/// [_apiKey] recibe el llave para hacer las solicitudes a la API.
///
/// [_client] recibe una instancia de [Client] para realizar las diferentes
/// peticiones a la API.
class Http {
  final String _baseUrl;
  final String _apiKey;
  final Client _client;

  Http({
    required String baseUrl,
    required String apiKey,
    required Client client,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _client = client;

  /// Realiza una consulta a la API
  ///
  /// Método asincrono para realizar diferentes tipos de petición (get,
  /// post, patch, delete, put) a la API de [Http].
  ///
  /// [path] Parametro requerido para realizar una solicitud especifica a la API.
  ///
  /// [onSuccess] Callback requerido, recibe un dato dinamico [responseBody] que
  /// es respuesta de la petición y retorna el un tipo generico R que es el(los)
  /// dato(s) que requerimos de la petición. onSuccess es llamado cuando la
  /// petición se ha realizado correctamente.
  ///
  /// [method] Recibe el enum HttpMethod para indicar el tipo de petición a
  /// realizar a la API, por defecto es [HttpMethod.get].
  ///
  /// [headers] Map opcional para pasar los headers necesarios para la peticion.
  ///
  /// [queryParameters] Map opcional para pasar los parametros de la petición.
  ///
  /// [body] Map opcional para pasar el body que ocupe la petición.
  ///
  /// [useApiKey] booleano para indicar si se necesita usar el [_apiKey], por
  /// defecto es true.
  ///
  /// El método retorna un [Either] con el error [HttpFailure] en caso que la
  /// petición haya fallado o la respuesta [R] si esta ocurrio de manera
  /// correcta.
  Future<Either<HttpFailure, R>> request<R>(
    String path, {
    required R Function(dynamic responseBody) onSuccess,
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool useApiKey = true,
    String languageCode = 'en',
    Duration timeout = const Duration(seconds: 10),
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;
    try {
      if (useApiKey) {
        queryParameters = {
          ...queryParameters,
          'api_key': _apiKey,
        };
      }
      Uri url = Uri.parse(
        path.startsWith('http') ? path : '$_baseUrl$path',
      );
      if (queryParameters.isNotEmpty) {
        url = url.replace(
          queryParameters: {
            ...queryParameters,
            'language': languageCode,
          },
        );
      }
      headers = {
        'Content-Type': 'application/json',
        ...headers,
      };
      final bodyString = jsonEncode(body);
      logs = {
        'url': url.toString(),
        'method': method.name,
        'body': body,
      };

      final Response response = switch (method) {
        HttpMethod.get => await _client.get(url).timeout(timeout),
        HttpMethod.post => await _client
            .post(
              url,
              headers: headers,
              body: bodyString,
            )
            .timeout(timeout),
        HttpMethod.patch => await _client
            .patch(
              url,
              headers: headers,
              body: bodyString,
            )
            .timeout(timeout),
        HttpMethod.delete => await _client
            .delete(
              url,
              headers: headers,
              body: bodyString,
            )
            .timeout(timeout),
        HttpMethod.put => await _client
            .put(
              url,
              headers: headers,
              body: bodyString,
            )
            .timeout(timeout),
      };

      final statusCode = response.statusCode;
      final responseBody = _parseResponseBody(
        response.body,
      );
      logs = {
        ...logs,
        'startTime': DateTime.now().toString(),
        'statusCode': statusCode,
        'responseBody': responseBody,
      };

      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(
          onSuccess(responseBody),
        );
      }
      return Either.left(
        HttpFailure(
          statusCode: statusCode,
          data: responseBody,
        ),
      );
    } catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'exception': e.runtimeType.toString(),
      };
      if (e is SocketException || e is ClientException) {
        logs = {
          ...logs,
          'exception': 'NetworkException',
        };
        return Either.left(
          HttpFailure(
            exception: NetworkException(),
          ),
        );
      }

      return Either.left(
        HttpFailure(exception: e),
      );
    } finally {
      logs = {
        ...logs,
        'endTime': DateTime.now().toString(),
      };
      _printLogs(logs, stackTrace);
    }
  }
}

/// Enum para los diferentes tipos de petición para una API.
enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}
