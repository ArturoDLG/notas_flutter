//Seccion 2
//Lecciones:
//15: Datos inmutables - final
//16: Datos inmutables - const
// ArturoDLG

/*
Los tipos de datos inmutables son utiles para definir valores que no seran o 
deban ser modificados en tiempo de ejecucion
*/
void main() {
  /*
  Declaración de una variable inmutable usando final

  final tipoDato nombreVariable = valor;

  Se pude presindir del tipo de dato, ya que el compilador infiere el tipo como
  en var
  */

  final username = 'Arturo'; // String
  //username = 'Luis'; -> invalido

  final DateTime currentData = DateTime.now();
  // DateTime nos permite manejar datos de tipo tiempo/fecha

  print(currentData);

  /*
  Declaración de una variable inmutable usando const

  const tipoDato nombreVariable = valor;

  Se pude presindir del tipo de dato, ya que el compilador infiere el tipo al 
  igual que en final.

  La diferencia con final, es que const debe de tener un valor asignado antes 
  de la compilacion; mientras que final puede ser asignado en tiempo de ejecucion 

  Otraa diferencia es que const solo puede ser usada con datos primitvos o clases
  con constructores de tipo const  
  */

  const limit = 100; // int
  const String apiKey = "MY_API_KEY";
  const firulais = Pet();
  // const DateTime currentData = DateTime.now(); -> clase sin constructor const
}

class Pet {
  const Pet(); // constructor de clase usando cosnt
}
