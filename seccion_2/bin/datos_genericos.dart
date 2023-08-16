//Seccion 2
//Lecciones:
//59 - 62: Datos genericos
//ArturoDLG

/*
Los datos genericos son una caracteristica de Dart que nos permite definir un 
tipo de dato particular para manejar dentro de una clase
*/

import 'dart:io';

void main(List<String> args) {
  final menu1 = Menu<String>(
    label: 'Are you a software developer?',
    options: [
      MenuOption(
        value: 'y',
        text: 'yes',
      ),
      MenuOption(
        value: 'n',
        text: 'no',
      ),
    ],
  );

  final selectedOption = menu1.choose();

  switch (selectedOption) {
    case "y":
      print('🤓');
      final menu2 = Menu<int>(
        label: 'What is your favorite?',
        options: [
          MenuOption(
            value: 1,
            text: 'Mobile',
          ),
          MenuOption(
            value: 2,
            text: 'Web',
          ),
          MenuOption(
            value: 3,
            text: 'Backend',
          ),
          MenuOption(
            value: 4,
            text: 'Other',
          ),
        ],
      );

      final selectedOption = menu2.choose();
      print('GREAT $selectedOption');
      break;

    case "n":
      print('😅');
      final menu3 = Menu<int>(
        label: 'What is your favorite?',
        options: [
          MenuOption(
            value: 1,
            text: 'Series',
          ),
          MenuOption(
            value: 2,
            text: 'Movies',
          ),
          MenuOption(
            value: 3,
            text: 'Games',
          ),
          MenuOption(
            value: 4,
            text: 'Other',
          ),
        ],
      );

      final selectedOption = menu3.choose();
      print('GREAT $selectedOption');
      break;
  }
}

/*
Para definir que una clase o metodo trabajara con un dato generico, debemos de 
seguir la siguiente sintaxis:

class CustomClass<Generic>{...}

Por convencion el nombre del dato generico inicia en mayuscula y por lo general 
es una sola letra o una palabra que no entre conflicto con el SDK de Dart y/o 
las dependencias que se usen.

Nota: podemos tener tantos datos genericos querramos, separandolos por coma:

class CustomClass<Generic1, Generic2, ...>{...}
*/
class Menu<T> {
  final String label;
  final List<MenuOption<T>> options;

  Menu({
    required this.label,
    required this.options,
  });

  T choose() {
    print("$label:");
    for (final option in options) {
      print(option);
    }

    final selectedoOption = stdin.readLineSync();
    final index =
        options.indexWhere((e) => e.value.toString() == selectedoOption);
    if (index != -1) {
      return options[index].value;
    }
    print('✖️ Invalid option, try again.');
    return choose();
  }
}

class MenuOption<T> {
  final T value;
  final String text;

  MenuOption({
    required this.value,
    required this.text,
  });

  @override
  String toString() {
    return "[$value] $text";
  }
}
