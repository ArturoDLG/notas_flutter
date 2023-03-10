//Seccion 2: 25. spread operator
// ArturoDLG

/*
  El spread o desestructuracion de un objeto consiste en agregar los 
  valores de una estructura a una nueva (List o Map).

  Sintaxis del spread 
  var nuevaEstructura = [...estructura, <elementos>];

  La posicion donde se coloque el objeto a desestructurar importa, ya que si se 
  coloca al inicio, los elementos de dicho objeto estaran al inicio, de igual 
  pasará si lo colocamos en medio o al final. 
  ejemplo:

  final numbers = [1, 2, 3, 4, 5];

  firstList = [...numbers, 6, 7]; // [1, 2, 3, 4, 5, 6, 7]
  middleList = [0, ...numbers, 6]; //[0, 1, 2, 3, 4, 5, 6]
  endList = [8, 9, 10, ...numbers]; //[8, 9, 10, 1, 2, 3, 4, 5]

  Los tipos de datos a manejar al crear el nuevo objeto usando la 
  desestructuracion si usamos la misma variable, debe de respetar los datos ya
  definidos. 
  ejemplo:

  List<String> fruits = ['apple', 'banana', orange'];

  fruits = [...fruits, 1, 2, 3]; // sintaxis invalida
  fruits = [...frutis, 'pears', 'cherry']; // sintaxis valida 
  */
void main() {
  // spread operator en listas

  List<int> numbers = [1, 2, 3, 4, 5];
  print('numbers: $numbers');

  //crear una nueva lista con los valores de number
  numbers = [...numbers, 6, 7, 8, 9, 10];
  print('new numbers: $numbers');

  // spread operator en maps

  Map<String, Object> json = {
    'name': 'Luis',
    'lastname': 'DLG',
    'age': 25,
  };

  print('json: $json');

  // crear un nuevo map con los valores de json
  json = {
    ...json,
    'height': 1.75,
    'weight': 68,
  };

  print('new json: $json');
}
