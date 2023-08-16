/*
Una variable o función global es todo aquello que no se encuentre dentro de una funcion o
clase, lo que implica que puede ser llamada y usada en cualquier parte del 
proyecto
*/
String apiKey = "";

// funcion global

String _newApyKey = "";

String get newApiKey => _newApyKey;

void updateApiKey(String apiKey) {
  _newApyKey = apiKey;
}

/*
Una variable/funcion  estatica es bastante similar en accesibilidad a una
estatica, con la diferencia de que esta debe estar instanciada en una clase, 
pero no será necesario crear una instancia de esta para usarla.
*/

class Test {
  static int counter = 0;

  @override
  String toString() {
    return 'Test(counter: $counter)';
  }
}

class Test2 {
  static int _otherCounter = 0;
  static int get otherCount => _otherCounter;

  static void setCounter(int count) {
    _otherCounter = count;
  }
}

/*
Nota: tanto las variables globales, como las estaticas ocupan espacio de memoria 
en el momento que se ejecuta el programa, asi no sean llamadas y/o instanciadas
en el codigo
*/


