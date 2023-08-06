//Seccion 2
//Lecciones:
//53: Herencia
//54: Clases abstractas
//ArturoDLG

void main(List<String> args) {
  final lazy = Dog(
    name: 'Lazy',
    age: 10,
    legs: 4,
  );
  final dory = Fish(
    name: 'Dory',
    age: 1,
    fins: 3,
  );
  print(lazy);
  print('Hey ${lazy.name}, run');
  lazy.run();

  print(dory);
  print('Hey ${dory.name}, swim');
  dory.swin();

  //podemos llamar al mismo metodo pero tendran comportamientos diferentes
  lazy.sleep();
  dory.sleep();
}

/*
La herencia es un mecanismo para crear nuevas clases utilizando de base una 
clase padre
*/

/*
Se considera como buena practica, que las clases padres no puedan ser 
instanciadas, ya que estas solamente deben de marcar los atributos y metodos 
que compartiran. Para crear una clase abstracta, solamente es necesario usar la
palabra reservada abstract antes de class de la siguiente manera:

abstract class NewClass
*/
abstract class Pet {
  final String name;
  final int age;

  //Para que los hijos puedan crear instancias constantes, el padre debe
  //de definirlo
  const Pet({
    required this.name,
    required this.age,
  });

  // Al definir metodos vacios en una clase abstracta, debemos de
  // sobreescribirlos en los hijos
  void sleep();
  void awake();

  @override
  String toString() {
    return 'Pet($name, $age)';
  }
}

/*
Para heredar de una clase, utilzamos la palabra reservada extends que nos 
permite tener acceso a los atributos y metodos que dispone la clase padre, el 
cual se hace de la siguiente manera:

class ChildClass extends ParentClass
*/

//Dog hereda los atributos name y age
class Dog extends Pet {
  final int legs; // atrubuto personalizado
  Dog({
    required String name,
    required int age,
    required this.legs,
  }) : super(
          name: name,
          age: age,
        );

  // metodos personalizados
  void run() {
    print('Running');
  }

  void jump() {
    print('jumpping');
  }

  //sobreescribiendo el metodo toString

  @override
  String toString() {
    return 'Dog($name, $age, $legs)';
  }

  @override
  void awake() {
    print('Awake dog');
  }

  @override
  void sleep() {
    print('Sleep dog');
  }
}

class Fish extends Pet {
  final int fins;
  Fish({
    required String name,
    required int age,
    required this.fins,
  }) : super(
          name: name,
          age: age,
        );

  void swin() {
    print('swinning');
  }

  @override
  void awake() {
    print('Awake fish');
  }

  @override
  void sleep() {
    print('Sleep fish');
  }
}
