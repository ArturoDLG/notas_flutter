//Seccion 2
//Lecciones:
//63 - 65: Futures
//ArturoDLG
/*
Future es una clase que nos permite trabajar codigo de manera asincrono, el cual 
nos permite esperar a que un proceso se realice para poder seguir con la
ejecucion de nuestro codigo.
*/

/*
Usando las palabras reservadas async y await, podemos indicarle al compilador 
cuando trabajaremos con funciones asincronas (async), y cuando querramos esperar
que una funcion termine su ejecucion para continuar con las siguientes lineas de 
codigo (await).

Para indicar que teabajaremos con funciones asincronas usamos la siguiente 
sintaxis:

tipoDato nameFunction() async {...}

Para indicar que queremos esperar a que termine la ejecucion de una funcion lo 
indicamos de la siguente forma:

await function();
final result = await function(); // Future que retorna algun resultado
*/
import 'dart:async';

void main(List<String> args) async {
  print('Hola');
  /*
  final f = sleep(5);
  f.then(
      // esta funcion nos permite ejecutar un codigo una vez termine la tarea
      (value) {
    /*
      El callback recibe como 'value' el valor retornado en el callback de la 
      funcion 
      */
    print(value);
    print('⌛');
  }, onError: (e, s) {
    print(e);
    print(s);
  });
  */

  // async & await
  final result = await sleep(3);
  print(result);
  print('⏰');

  try {
    //es necesario usar await para capturar un error
    final message = await otherSleep(2000);
    print(message);
  } catch (e) {
    print(e);
  }
}

Future<String> sleep(int seconds) {
  return Future.delayed(
    Duration(seconds: seconds),
    () {
      //propagando un error para ser capturado
      //throw AssertionError('Custom error');
      return 'finalizado';
    },
  );
}

/*
Otra manera de generar futures es mediante el uso de la clase Completer, el cual
nos hace indicar el inicio y final de la ejecucion del future manualmente 
*/
Future<String> otherSleep(int milliseconds) {
  Completer<String> completer = Completer();
  Timer(
    Duration(milliseconds: milliseconds),
    () {
      // Propagando un error usando completer para que pueda ser capturado por try
      //catch
      completer.completeError(
        RangeError('custom error'),
      );
      //completer.complete('🥶');
    },
  );
  return completer.future;
}
