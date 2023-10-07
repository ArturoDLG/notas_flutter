/// Clase para modelar la información de un usuario de la app.
///
/// [id] identificador numerico [int] del usuario.
///
/// [username] nombre con el cual se registro el usuario al servicio.
class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });
}
