//Seccion 2
//Lecciones:
//20 - 24: Maps
// ArturoDLG

void main() {
  /*
  Declaración de una lista

  Map<clave, valor> nombreMap = {<clave1 : valor1>...};

  Nota: clave y valor son tipos de datos, estos pueden ser diferentes entre sí

  Nota: si declaramos un map usando var o final, su clave y valor seran de tipo 
  dynamic
  ejemplo:
  var mapa = {}; // Map<dynamic, dynamic>

  En caso de definir valores al momento de declarar nuestro map, este adoptará
  los tipos de datos que estemos usando si son iguales, o los definirá como 
  Object si son diferentes

  Una forma de definirle un tipo a la clave y al valor, es especificando los 
  tipos de la siguiente manera:
  var mapa = <clave, valor> {}; //Map<clave, valor>
  */

  Map<String, String> users = {};

  //agregar una clave
  users['user1'] = 'Arturo';
  users['user2'] = 'Jose';
  print(users);

  //modificar el valor de una clave
  users['user1'] = 'Andres';
  print('Modify user1: $users');

  //eliminar una clave
  final removed = users.remove('user2');
  print('remove key $removed');
  print(users);

  //remover todos los elementos del map
  users.clear();
  print(users);

  // agregar varios elementos
  users.addAll(
    {
      'user1': 'Luis',
      'User2': 'Andres',
      'User3': 'Jesus',
    },
  );
  print('Add new users to map: $users');

  final products = <int, String>{
    1: 'macbook pro',
  };
  // buscar una llave o crearla si no se encuentra
  final element = products.putIfAbsent(0, () => 'Mac mini');
  print('product 0 : $element');
  print(products);

  /*
  Nota: el metodo putIfAbstent es igual a el siguiente fragmento de codigo:

  if(!products.containsKey(0)){
    products[0] = 'Mac mini';
  }
  */

  //eliminar multiples elementos de un map
  products.removeWhere((key, value) => value.contains('pro'));
  print('remove "pro" products: $products');

  //obtener las llaves del map
  print('products keys ${products.keys.toList()}');

  // obtener valores del map
  print('products values ${products.values.toList()}');

  // Usar map como un JSON
  final user = <String, Object>{
    'name': 'Arturo',
    'lastname': 'De La Garza',
    'age': 25,
    'email': 'micorreo@micorreo.com',
    'salary': 8000.95,
    'enable': true,
    'location': {
      'country': 'Mexico',
      'countryCode': 'MX',
      'city': 'Cocula',
    },
    'pets': [
      {
        'name': 'Charlie',
        'age': 3,
      },
      {
        'name': 'Simon',
        'age': 1,
      },
    ],
  };

  print("Age ${user['age']}"); // obtener la edad del usuario
  print("Email ${user['email']}"); // obtener el correo del usuario

  final location = user['location']; // obtener el objeto de country

  // castear country a Mao
  final country = (location as Map<String, String>)['country'];
  print("Country $country");

  /*
  Nota: Cuando queremos utilizar diferentes tipos de datos en los valores de 
  nuestros maps, podemos elegir entre usar dynamic y Object.

  Si utilizamos Object y queremos utilizar metodos de un tipo de dato especifico,
  debemos de castear al dato que queremos emplear. Esto hara que escribamos mas
  codigo, pero nos prevendra de errores como usar metoos no propios de la clase 
  y detectar si una clave es nula.

  En cambio, si utilizamos dynamic, el casteo a un tipo de dato es opcional, por
  lo que podremos usar los metodos de manera directa en nuestro codigo, pero con
  la desventaja de o detectar errores hasta el tiempo de ejecucion.
  */
}
