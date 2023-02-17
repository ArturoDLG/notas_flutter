//Seccion 2
//Lecciones:
//11. variables usando var
//12. datos dinamicos
// ArturoDLG

void main() {
  /*
  Declaración de una variable usando var

  var nombreVariable = valor;
  */

  var counter = 0;
  var nickname = '@ArturoDLG';

  /*
  Una vez asignado el valor a la variable usando esta sintaxis, el compilador
  asigna el tipo de dato, el cual no puede ser cambiado en tiempo de ejecucion 
  */

  //counter = 2.5 -> operacion no valida
  nickname = "@LuisDLG"; //-> operacion valida

  /*
  Declaracion de un avariable de tipo dinamico

  dynamic dynamicValue = value;
  */
  dynamic dynamicValue = "10"; // String
  print(dynamicValue.runtimeType);

  dynamicValue = 10; // int
  print(dynamicValue.runtimeType);

  /*
  A diferencia de usar var, dynamic no asigna un tipo de dato a la variable, 
  permitiendo cambiar en tiempo de ejecucion el tipo dato de la variable.

  dynamic no es recomendado salvo casos especificos, ya que toda variable
  deberia tener un tipo de datos, por cuestiones de seguridad
  (previniendo errores en tiempo de ejecucion) y rendimiento
  */
}
