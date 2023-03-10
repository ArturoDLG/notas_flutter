//Seccion 2
//Lecciones:
//28 - 29: switch
// ArturoDLG

/*
Switch es una estructura selectiva, esto quiere decir que dadouna entrada, 
ejecutara el codigo dentro de una de las opciones establecidas en el.
*/

void main() {
  final weekDay = DateTime.now().weekday;

  switch (weekDay) {
    case 1: // opcion
      print('Monday');
      break; // para salir de switch

    case 2:
      print('Tuesday');
      break;

    case 3:
      print('Wednesday');
      break;

    case 4:
      print('Thursday');
      break;

    case 5:
      print('Friday');
      break;

    case 6:
      print('Saturday');
      break;

    case 7:
      print('Sunday');
      break;
    default: // opcion que se ejecuta en caso de ingresar un valor que no existe
      print('Invalid week day');
  }

  // otras maneras de usar switch
  switch (weekDay) {
    case 2:
    case 3:
    case 4: // podemos combinar casos para ejecutar un mismo bloque de codigo
      print('Working day');
      break;

    case 6:
    case 7:
      print('half day');
      break;

    default:
      print('day off');
  }
}
