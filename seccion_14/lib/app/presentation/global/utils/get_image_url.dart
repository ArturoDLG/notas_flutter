/// Retornar el path para obtener las imagenes de themovidedb
String getImageUrl(
  String path, {
  ImageQuality imageQuality = ImageQuality.w300,
}) {
  return 'https://tmdb.org/t/p/${imageQuality.name}$path';
}

enum ImageQuality {
  w300,
  w500,
  original,
}
