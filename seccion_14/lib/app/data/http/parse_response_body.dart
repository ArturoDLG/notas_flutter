part of 'http.dart';

/// Metodo que convierte el responseBody de la peticion en un objeto manejable
/// por Dart [Map, List]. En caso de no poder ser transformado, retorna el mismo
/// [String].
dynamic _parseResponseBody(String responseBody) {
  try {
    return jsonDecode(responseBody);
  } catch (_) {
    return responseBody;
  }
}
