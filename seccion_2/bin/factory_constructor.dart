//Seccion 2: 45. Factory Constructor
// ArturoDLG
void main(List<String> args) {
  final simon = Pet(name: 'Simon', age: 1);

  // instancia usando un factory constructor
  final fifi = Pet.fromBirthday('fifi', '2020-09-12');
  final charly = Pet.fromName('charly');

  print(simon);
  print(fifi);
  print(charly);
}

/*
A diferencia de otros lenguajes, Dart no acepta mas de un constructor
por clase, por lo cual se usan los factory constructors, metodos de los
cuales podemos crear instancias de nuestra clase con un comportamiendo
diferente
*/
class Pet {
  String name;
  int age;

  Pet({
    required this.name,
    required this.age,
  });

  // Factory constructor para crear una instancia de la clase
  // a partir de la fecha de cumpleaños para calcular la edad

  factory Pet.fromBirthday(String name, String birthdayAsString) {
    final birthday = DateTime.parse(birthdayAsString);
    final currentDate = DateTime.now();

    final days = currentDate.difference(birthday).inDays;
    final age = (days / 365).round();

    return Pet(name: name, age: age);
  }

  factory Pet.fromName(String name) {
    return Pet(name: name, age: 0);
  }

  @override
  String toString() {
    return 'Pet($name, age: $age)';
  }
}
