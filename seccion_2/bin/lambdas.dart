//Seccion 2: 66. Lambda functions
// ArturoDLG

/*
Las funciones lambdas son funciones que pueden ser reescritas cuando el retorno 
de estas es de una sola linea, simplificando la sintaxis de esta de la siguiente 
manera:

tipoDato lambdaFunction() => value;
*/
void main(List<String> args) {
  print(sum(10, 5));
  print(firstWord('this is a phrase'));
}

// ejemplos

int sum(int a, int b) => a + b;

String firstWord(String phrase) => phrase.split(' ').first;
