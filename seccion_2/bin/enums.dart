//Seccion 2: 52. Enums
// ArturoDLG
void main(List<String> args) {
  print(Status.values); //muestra los valores del enum

  for (final status in Status.values) {
    print('${status.index} : ${status.name}');
  }

  final orderStatus = Status.created;

  switch (orderStatus) {
    case Status.created:
      print('✅');
      break;
    case Status.ready:
      print('🛍️');
      break;
    case Status.onTheWay:
      print('🛵');
      break;
    case Status.delivered:
      print('👌🏻');
      break;
  }
}

/*
Los enums son un tipo de clase el cual nos permite crear constantes nombradas 
esto para acceder a ellas de manera sencilla. Al crear un enum, se le asigna un 
valor entero a cada miembro dado al orden que estan escritos
*/
enum Status {
  created,
  ready,
  onTheWay,
  delivered,
}
