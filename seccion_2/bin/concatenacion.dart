//Seccion 2: 13. Concatenacion
// ArturoDLG

void main() {
  String name = 'Arturo', lastName = 'DLG';
  int age = 25;

  // concatenar 2 strings
  String fullName = name + ' ' + lastName;
  print(fullName);

  // castear un dato a String
  String resultCast = fullName + ' ' + age.toString();
  // .toString convierte el entero age a String
  print(resultCast);

  // formatear variables
  String resultFormat = '$name $lastName, age: $age';
  print(resultFormat);

  // llamar a metodos dentro de un formateo
  String lengthLastName = '$lastName length: ${lastName.length}';
  // usamos {} despues de $ para poder llamar al metodo
  print(lengthLastName);

  // usar comillas dentro de un string
  String phrase = 'My name is "$fullName" ';
  /*
  otra alternativa a intercalar entre comillas sencillas y dobles es usando
  \" para que pueden ser imprimidas. 
  */

  print(phrase);
}
