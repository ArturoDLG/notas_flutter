//Seccion 2: 49. Propiedades inmutables
// ArturoDLG
void main(List<String> args) {
  /*
  Los valores de las propiedades deben de ser conocidas antes del tiempo de 
  ejecucion, esto quiere decir que los valores no pueden provenir de funciones 
  que calculen o generen estos valores, o de instancias que no sean constantes
  */
  const krypto = Pet(name: 'krypto', age: 3); // definiendo Pet como constante

  print(krypto);
  // No podemos cambiar la propiedad ya que es inmutable
  // krypto.name = 'superperro';

  // cambiar una propiedad de la clase

  //Usamos el tipo de dato en lugar de const para poder usar otra instancia
  Pet felix = Pet(name: 'feliz', age: 11);
  print(felix);

  felix = felix.copyWith(name: 'felíx', age: 15);
  print(felix);
}

/*
Podemos definir nuestras propiedades de clase como final para que estas sean 
inmutables y no se cambien una vez esten definidas 
*/
class Pet {
  final String name;
  final int age;

  /*
  Si todas nuestras propiedades son de tipo final, podemos usar un constructor 
  de tipo 'const' para que nuestra clase sea una cosntante
  */
  const Pet({
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return 'Pet($name, age: $age)';
  }

  /*
  Si queremos realizar una modificacion a nuestra instancia, pero que esta siga 
  siendo constante, debemos crear una funcion que genera una copia con los 
  cambios, que por convencion se llama copyWith
  */

  Pet copyWith({
    String? name,
    int? age,
  }) {
    return Pet(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
