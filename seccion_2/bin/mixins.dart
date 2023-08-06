//Seccion 2
//Lecciones:
//55 - 56: mixins
//ArturoDLG
void main(List<String> args) {
  final dolphin = Dolphin();
  dolphin.swin();

  final bat = Bat();
  bat.walk();
  bat.fly();

  final cat = Cat();
  cat.walk();

  final dove = Dove();
  dove.walk();
  dove.fly();

  final duck = Duck();
  duck.swin();
  duck.fly();
  duck.walk();

  final shark = Shark();
  shark.swin();

  final flyingFish = FlyingFish();
  flyingFish.fly();
  flyingFish.swin();
}

/*
En Dart no existe la herencia multiple, por lo cual se debe de recurrir a un 
recurso del lenguaje llamado mixins
*/

abstract class Animal {}

abstract class Fish extends Animal {}

abstract class Bird extends Animal {}

abstract class Mammal extends Animal {}

/*
Los mixins nos permite compartir metodos y atributos con las clases que los 
implementa, con la diferencia que se pueden utilizar varios en una sola clase. 
Son similares a las clases abstractas, ya que nos permite dejar funciones sin 
definir cuerpo. 
Para definir un mixin, solamente debemos de utilizar la palabra reservada de la
siguiente forma:

mixin implementMixin{...}

Como convencion se utiliza el sufijo -Mixin para indicar que este es una 
implementacion de dicha funcion.

Una caracteristica de los mixins es que podemos definir si queremos que 
solamente se utilicen en cierto tipo de clases usando la palabra on, lo cual 
hará que marque un error si lo implementamos en una clase diferente. Este se usa
de la siguiente forma:

mixin implementMixin on SupportClass {...}
*/

//Mixins
mixin WalkMixin on Animal {
  void walk() {
    print('$runtimeType Walking');
  }
}

mixin SwimMixin on Animal {
  void swin() {
    print('$runtimeType Swimming');
  }
}

mixin FlyMixin on Animal {
  void fly() {
    print('$runtimeType Flying');
  }
}

// Mamiferos
class Dolphin extends Mammal with SwimMixin {}

class Bat extends Mammal with WalkMixin, FlyMixin {}

class Cat extends Mammal with WalkMixin {}

/*
Marca error por implementar un mixin en una clase que no extiende de la clase 
animal.
*/
//class Person with FlyMixin{}

//Aves
class Dove extends Bird with WalkMixin, FlyMixin {}

class Duck extends Bird with SwimMixin, FlyMixin, WalkMixin {}

//Peces
class Shark extends Fish with SwimMixin {}

class FlyingFish extends Fish with SwimMixin, FlyMixin {}
