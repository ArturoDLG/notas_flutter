//Seccion 2:
//Lecciones:
//41: Definir una clase
//42: El operador de igualdad y el hashCode
// ArturoDLG
void main(List<String> args) {
  final firulais = Pet();
  firulais.name = 'Firulais';
  firulais.age = 3;

  print(firulais);

  //Cada instancia de una clase personalizada, tiene hashCode diferente
  //Aunque sus datos sean los mismos, a menos que se sobreescriban el
  //operador de igualdad y el hashCode

  final otherFirulais = Pet();
  otherFirulais.name = 'Firulais';
  otherFirulais.age = 3;

  print(firulais.hashCode);
  print(otherFirulais.hashCode);

  //comprobando que 2 instancias son iguales
  print(firulais == otherFirulais);

  final solovino = Pet();
  solovino.name = 'solovino';
  solovino.age = 5;

  print(firulais == solovino);
}

class Pet {
  // propiedades o atributos
  String? name;
  int? age;

  //sobreescribiendo el metodo toString
  @override
  String toString() {
    return 'Pet($name, age: $age)';
  }

  // sobreescribiendo el operador ==
  @override
  bool operator ==(Object other) {
    if (hashCode != other.hashCode) return false;

    if (other is Pet) {
      return other.name == name && other.age == age;
    }
    return false;
  }

  // sobreescribiendo el hashCode
  // Una vez sobreescrito, el hashCode de 2 instancias con atributos iguales
  // será el mismo
  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode;
  }
}
