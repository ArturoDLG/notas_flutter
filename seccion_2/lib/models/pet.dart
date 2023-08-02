//Clase pet para la leccion de datos privados
class Pet {
  // El guion bajo indica que un dato es privado
  String _name;
  int _age;
  final _history = _History();
  /*
  Los getter son un tipo de metodo que nos permite exponer los datos de
  nuestros atributos de manera controlada. Para crear un getter seguimos 
  la siguiente sintaxis:
  
  tipoDato get nombre_getter {
    ...
    return ...
  } 
  */
  //getters
  String get name => _name;

  int get age => _age;

  DateTime get updateAt => _history.updateAt;

  /*
  Los setter son un tipo de metodo que nos permite modificar de manera controlada
  los atributos de nuestra clase. Para definir un setter hacemos lo siguiente:
  
  set nombre_setter(tipoDato parametro){
    ...
  }

  Nota: se recomienda en medida de lo posible evitar el uso tanto de getters 
  como setters al mismo tiempo, eligiendo los getters y sustituyendo los setters
  por metodos normales para modificar los valores del dato deseado
  */

  set name(String newName) {
    if (name != '') {
      _sendReport();
      _name = newName;
    }
  }

  set age(int newAge) {
    if (age >= 0) {
      _sendReport();
      _age = newAge;
    }
  }

  /*
  Tambien podemos crear metodos privados, para ejecutar codigo que solamente 
  sea asequible desde la clase, esto lo haremos al igual que con los atributos
  colocanco un guion bajo al inicio del nombre del metodo 
  */

  void _sendReport() {
    print('Enviando reporte 🔄️');
    _history.update();
  }

  Pet({
    required String name,
    required int age,
  })  : _name = name, // inicializamos los datos privados desde el
        _age = age; // constructor

  @override
  String toString() {
    return 'Pet($_name, age: $_age)';
  }
}

/*
Tambien podemos definir clases privadas en Dart, las cuales seran accesibles
dentro del archivo definido, aligual que en los metodos y atributos, estos se
definen usando un guión bajo
*/

class _History {
  final DateTime createdAt = DateTime.now();
  final List<DateTime> _items = [];

  DateTime get updateAt {
    if (_items.isEmpty) {
      return createdAt;
    }
    return _items.last;
  }

  void update() {
    _items.add(DateTime.now());
  }
}
