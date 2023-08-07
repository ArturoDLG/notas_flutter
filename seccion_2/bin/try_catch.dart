//Seccion 2
//Lecciones:
//57 - 58: try catch
//ArturoDLG
import 'dart:io';

void main(List<String> args) {
  final age = calculateAge();
  print(age);
}

/*
try catch es una funcion nos permite capturar los errores que pueden suceder en 
un segmento de codigo, para manejarlos y evitar que se dentega la ejecucion de 
nuestro codigo. En try, nosotros agregamos el codigo donde sabemos que podria 
suceder un error y catch agregamos el codigo que se ejecutara si sucede un error
*/
double? calculateAge() {
  try {
    print('Enter a birthday: ');
    final text = stdin.readLineSync();

    if (text != null) {
      final birthday = DateTime.parse(text);
      final currentDate = DateTime.now();

      final days = currentDate.difference(birthday).inDays;
      final age = days / 365;

      //provocamos un error para capturarlo en el catch
      String? message;
      print(message!.length);

      return age;
    }
  } on FormatException catch (e, s) {
    //Este bloque nos permite capturar un tipo de error en especifico
    //Podemos usar estos bloques cuantos queramos
    print('Invalid birthday');
    //podemos usar catch para manejar el error y el stack trace dentro del
    //bloque, pero este es opcional
    print(e.message);
    print(s);
  } catch (e, s) {
    /*
    Podemos manejar los errores mediante if, al usar is, lo casteamos.
    si queremos comprobar que un error no es de un determinado tipo, solamente 
    colocamos el operador ! despues de is 
    */
    if (e is! RangeError) {
      print('e is not a RangeError');
    }
    print(e); // error
    print(s); //stack trace
  } finally {
    //Este bloque se ejecuta al final del bloque, sin importar si sucede o no un
    //error, y se ejecutara antes de un return, por lo cual return no se puede
    //colocar aqui
    print('✅');
  }
  return null;
}
