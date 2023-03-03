//Seccion 2
//Lecciones:
//17: Listas - parte 1
// ArturoDLG

void main() {
  /*
  Declaración de una lista

  List<tipoDato> nombreLista = [<elementos>...];

  Nota: si declaramos una lista usando var, esta será de tipo dynamic
  ejemplo:
  var lista = []; // List<dynamic>

  Una forma de definirle un tipo, es espexificando el tipo de la siguiente 
  manera:
  var lista = <tipoDato> []; //List<tipoDato>
  */
  List<int> numbers = [1, 2, 3];

  // agregar un valor a la lista
  numbers.add(4);
  print(numbers);

  //usando final en una lista
  final otherList = <int>[];

  // podemos modificar la lista con sus respectivos metodos
  otherList.add(10);
  print("Lista final = $otherList");

  otherList.clear();
  print("Lista final = $otherList");

  /*
  Cuando definimos una lista como final, es posible modificarla (como agregar
  nuevos elementos, modificar los elementos, eliminarlos, o dejar la lista 
  vacia) pero no podemos referenciar una lista diferente
  
  ejemplo:
  otherList = []; // invalido
  */

  //agregar los valores de una lista a otra lista
  final otherNumbers = <int>[5, 6, 7];
  numbers.addAll(otherNumbers);

  print("numbers + otherNumbers = $numbers");

  //eliminar un elemento de la lista por indice
  numbers.removeAt(0);
  print("remove first element $numbers");

  /*
  Nota: removeAt solo funciona con indices dentro de la longitud de la lista, de
  caso contrario, dara error
  */

  //eliminar un elemento por valor
  numbers.remove(5);

  /*
  Nota: em metodo remove splo remueve la primera incidencia de elemento a quitar
  de la lista si existe mas de uno. Si se desea remover todas las incidencias
  de un elemento buscado, debes de utilizar le metodo removeWhere

  Si el elemento no existe dentro de la lista, entonces el metodo no modifica la 
  lista.

  el metodo retorna un valor booleano que indica si el valor fue encontrado.
  */

  //eliminar ultimo elemento de la lista
  numbers.removeLast();

  final prices = <int>[12, 32, 45, 67, 69, 90, 17];
  print("prices $prices");

  //filtrar elementos que cmplan con un criterio
  print(prices.where((element) => element % 2 != 0));

  //eliminar elementos que cumplan un criterio
  prices.removeWhere((element) => element % 2 == 0);

  print("prices after remove even numbers $prices");

  /*
  Nota: La diferencia entre where y removeWhere es que el primero no modifica la 
  lista, si no que crea un nuevo Iterable con el filtro aplicado, en cambio la 
  segunda si afecta a la lista donde aplicamos el metodo

  Si queremos que tener una lista en lugar de un iterable en el metodo where, 
  nosotros debemos de aplicar el metodo toList
  */

  // obtener el indice de un elemento de la lista
  final names = <String>['Luis', 'Andres', 'Jose', 'Arturo'];

  // iterando en la lista hasta cumplir una condicion
  int andresIndex = names.indexWhere((element) => element == 'Andres');
  print('Andres index is $andresIndex');

  // buscar un elemento directamente
  int joseIndex = names.indexOf('Jose');
  print('Jose index is $joseIndex');

  /*
  Nota: indexOf se recomienda usar solamente con datos primitivos, para clases
  personalizadas se recomienda usar indexWhere para un mejor control
  */

  // buscar el ultimo elemento de una lista que coincida con una condicion

  final lastElement = names.lastWhere((element) => element.startsWith('A'));
  print('Last element that starts with "A" $lastElement');

  /*
  Nota: Si el criterio de busqueda no es encontrado en la lista, el metodo
  lastWhere nos devolvera un error, para evitar esto, debemos de utilizar el 
  parametro orElse
  */

  // usando el parametro orElse
  final notFound = names.lastWhere(
    (element) => element.startsWith('S'),
    orElse: (() => 'Not found'), // funcion que se ejecuta en caso de no
    // encontrar un elemento
  );

  print('Last element thah starts with "S" $notFound');
}
