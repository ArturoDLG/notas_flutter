part of 'http.dart';

/// Metodo para mostrar un mensaje en consola de nuestras peticiones, para
/// conocer su estado al momento de ejecutarse, el contenido de la petición y
/// si ha ocurrido un error, la causa de este; todo esto en modo debug.
void _printLogs(
  Map<String, dynamic> logs,
  StackTrace? stackTrace,
) {
  if (kDebugMode) {
    log(
      """
      -------------------------------------------------------------
       
        ${const JsonEncoder.withIndent(' ').convert(logs)}
      -------------------------------------------------------------
        """,
      stackTrace: stackTrace,
    );
  }
}
