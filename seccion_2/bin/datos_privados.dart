//Seccion 2:
//Lecciones:
//46 - 47: Datos privados
//48: Clases privadas
// ArturoDLG

/*
Los datos privados son aquellos atributos que solamente son accesibles 
dentro de la definicion de la propia clase. Estos datos solamente son 
accesibles si de tiene definidos en la clase setters y/o getters
*/
import 'package:seccion_2/models/pet.dart';

void main(List<String> args) {
  final clifford = Pet(name: 'Clifford', age: 5);

  print(clifford);
  // ver el historial de cambios
  print(clifford.updateAt);
  print(
    'name ${clifford.name}',
  ); // accediendo al atributo name a traves del getter
  print(
    'age ${clifford.age}',
  );

  // modificando valores
  clifford.age = 10;
  clifford.name = 'cliff';

  print(clifford);

  // ver el historial de cambios
  print(clifford.updateAt);
}
