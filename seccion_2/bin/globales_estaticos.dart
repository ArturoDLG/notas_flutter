//Seccion 2:
//50 - 51: Variables globales y estaticas
// ArturoDLG

import 'package:seccion_2/utils/api_key.dart'; // importando la variable global

void main(List<String> args) {
  print('apiKey: $apiKey');
  apiKey = 'Some value'; // modificando la variable
  print('apiKey: $apiKey');

  print('newApiKey: $newApiKey');
  //newApiKey = 'algo'; // al ser privada no podemos acceder a la variable
  updateApiKey('1a2b3c');
  print('newApiKey: $newApiKey');

  var test = Test();
  print(test);
  Test.counter = 10; //modificando la variable sin instanciar
  print(Test.counter);
  print(test);

  print(Test2.otherCount);
  //Test2.otherCount = 1; // solamente esta implementado el getter
  Test2.setCounter(1);
  print(Test2.otherCount);
}
