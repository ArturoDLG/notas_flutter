//Seccion 2
//Lecciones:
//30: while
//31: do-while
//32: for
// ArturoDLG

/*
Los bucles nos permiten repetir secciones de codigo, ya sea hasta que se cumple
una condicion o que se ejecute determinado numero de veces
*/

void main() {
  // bucle while
  int index = 50;

  while (index <= 100) {
    // condicion para ejecutar el bucle

    if (index == 70) {
      print('🚩');
      break; // forzar la salida de un bucle
    }

    print(index);
    index++; // cambio en la variable de la condicion
  }

  // bucle do-while
  int number = 20;
  do {
    print('number $number');
    number++;
  } while (number <= 10); // la condicion se revisa al final

  /*
  Nota: la diferencia entre while y do while es que while no se ejecuta si la
  condicion no se cumple desde un principio; por el contrario, do while ejecutara
  al menos una vez el codigo dentro de este aunque la condicion no se cumpla
  */

  // bucle for
  for (int i = 0; i <= 15; i++) {
    print('counter $i');

    if (i % 2 == 0) {
      continue; // ignora el codigo despues de este y pasa a la siguiente iteracion
    }

    print('🍕');
  }

  final emojis = ['👍', '✌️', '👌', '🙌', '🤝'];
  // iterando en una coleccion
  for (final emoji in emojis) {
    print(emoji);
  }
}
