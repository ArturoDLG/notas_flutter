//Seccion 2:
//Lecciones:
//43: Late
//44: Constructores
// ArturoDLG

void main(List<String> args) {
  final godart = Pet();
  //definimos los valores de los atributos
  godart.age = 10;
  //godart.age = null; // si intentamos dejar como nulo el valor de un
  // atributo, Dart nos indicará un error
  godart.name = 'Godart';

  print(godart);

  //clase con constructror
  final gary = PetwithConst('Gary', 3);
  print(gary);

  //clase con parametros de nombre
  final scooby = PetwithParamName(name: 'Scooby Doo', age: 8);
  print(scooby);
}

/*
Si queremos crear una clase a la cual le definimos los valores del atributo
despues de crear una instancia y que estos no sean nulos, usamos 'late' 
para indicarle a Dart que estos atributos tomaran un valor en un punto de
la ejecucion del codigo
 */
class Pet {
  late String name;
  late int age;

  @override
  String toString() {
    return 'Pet($name, age: $age)';
  }
}

//Clase con constructor
class PetwithConst {
  String name;
  int age;

  PetwithConst(this.name, this.age);

  @override
  String toString() {
    return 'PetWithConst($name, age: $age)';
  }
}

//Clase con constructor con parametros por nombre
class PetwithParamName {
  String name;
  int age;

  PetwithParamName({
    required this.name,
    required this.age,
  }) {
    //podemos ejecutar codigo dentro de nuestro constructor
    print('New pet 🐕');
  }

  @override
  String toString() {
    return 'PetWithParamName($name, age: $age)';
  }
}
