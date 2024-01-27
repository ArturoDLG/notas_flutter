import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../services/remote/internet_checker.dart';

/// Clase implementadora de la logica de conexion a internet
class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;
  final _controller = StreamController<bool>.broadcast();
  late bool _hasInternet;
  StreamSubscription? _subscription;

  /// [_connectivity] Instancia de [Connectivity] para realizar una conexión a
  /// internet.
  ///
  /// [_internetChecker] Instancia de [InternetChecker] para comprobar que una
  /// conexión tiene salida a internet.
  ConnectivityRepositoryImpl(
    this._connectivity,
    this._internetChecker,
  );

  @override
  Future<void> initialize() async {
    Future<bool> hasInternet(ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        return false;
      }
      return _internetChecker.hasInternet();
    }

    _hasInternet = await hasInternet(
      await _connectivity.checkConnectivity(),
    );
    //resolviendo bug en IOS
    _connectivity.onConnectivityChanged.skip(Platform.isIOS ? 1 : 0).listen(
      (event) async {
        _subscription?.cancel();
        _subscription = hasInternet(event).asStream().listen(
          (connected) {
            _hasInternet = connected;
            if (_controller.hasListener && !_controller.isClosed) {
              _controller.add(_hasInternet);
            }
          },
        );
      },
    );
  }

  /// Metodo para checar la conexion a internet
  @override
  bool get hasInternet => _hasInternet;

  @override
  Stream<bool> get onInternetChanged => _controller.stream;
}
