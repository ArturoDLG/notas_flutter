import '../models/notification.dart';

/// Clase se para implementar la logica de manejo de notificaciones.
abstract class NotificationsRepository {
  Stream<AppNotification> get onNotification;
  Future<void> dispose();
}
