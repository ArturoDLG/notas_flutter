import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

/// Clase para comprobar la conexion a internet del dispositivo
class InternetChecker {
  /// Metodo que comprueba la conexion a internet
  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        // web
        final response = await get(
          Uri.parse('google.com'),
        );
        return response.statusCode == 200;
      } else {
        // desktop y mobile
        final list = await InternetAddress.lookup('google.com');
        return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
      }
    } catch (e) {
      return false;
    }
  }
}
