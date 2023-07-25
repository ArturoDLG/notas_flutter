//Seccion 2: 40. null check operator
// ArturoDLG

/*
El null check operator es un operador (representado por el !) 
que se usa cuando estamos realmente seguros de que un dato que 
recibimos no podras ser nulo, saltando asi las verificaciones 
del compilador de Dart.

Ejemplo:
final days = age!.inDays;

*/
void main(List<String> args) {
  final age = calculatedAge('1997-10-10');
  // Si el valor que devuelve la funcion es null
  // el programa devolvera un error
  //final age = calculatedAge('');
  final days = age!.inDays;

  print('$days days have passed');
}

Duration? calculatedAge(String birthdayAsString) {
  final birthday = DateTime.tryParse(birthdayAsString);

  if (birthday != null) {
    final current = DateTime.now();
    return current.difference(birthday);
  }

  return null;
}
