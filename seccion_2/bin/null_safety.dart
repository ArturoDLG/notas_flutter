//Seccion 2: 34. null safety
// ArturoDLG

/*
Null safety son una serie de car=acterizticas implementadas en Dart para 
prevenir errores de nulos durante la ejecucion del programa
*/
void main() {
  /*
  Para que un tipo de dato pueda recibir valores nulos, deberemos de usar el 
  operador '?' para indicarle a Dart. 
  ejemplo:

  tipoDato? nombreVariable = valor;
  */
  String? name = 'Luis'; // indicamos que name puede ser nulo
  print(name.length);

  name = null;
  print(name);

  /*
  Si  nosotros queremos ejecutar un codigo donde podemos estar usando nulos, 
  tendremos que validarlo, una opcion es utilizando if para comprobarlo; otro 
  de los mecanismos que tiene Dart es colorcar el operador '?' despues de la
  variable para poder acceder a los metodos de la clase, y al manejarlo este 
  devolvera null de ser el caso.

  Nota: no podemos hacer operaciones entre datos nullables y datos no nulables
  ejemplo: 
  int? n;
  print(n + 5); // sintaxis invalido;
  */

  // validar que un tipo de dato sea nulo
  String? lastname;
  print(lastname?.length); // null

  /*
  Los maps por defecto sus valores son nullables,puesto a que se podria consultar
  una clave que no exista, por lo cual es necesario manejarlos como nulos
  */
  //nullables en Maps
  final users = {0: 'Arturo'};
  print(users[0]?.toLowerCase());
}
