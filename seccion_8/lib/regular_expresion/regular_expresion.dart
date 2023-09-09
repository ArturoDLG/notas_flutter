//Seccion 8
//lecciones:
//174: Expresiones regulares
//ArturoDLG

/* 
Las expresiones regulares son un tipo de sintaxis que nos permite encontrar un 
patron en una cadena de texto a traves de ciertas reglas. 

Para poder escribir una expresion regular es necesario usar raw strings, que son
un tipo de string caracterizado por tener una 'r' antes del string y que ignora 
a los caracteres de escape; y de la clase RegExp, la cual nos permite procesar 
la sintaxis escrita en nuestro raw string. 
*/

void main(List<String> args) {
  print(r'hello\nworld'); //raw string

  //Expresiones regulares
  // encuentra si una frase inica con mayuscula
  final regExp = RegExp(r'^([A-Z])\w+');
  print(regExp.hasMatch('Hola123'));

  /*
  Validar que una contraseña cumpla las siguientes caracteristicas:
    > tener al menos un digito
    > tener al menos una letra minuscula
    > tener al menos una letra mayuscula
    > debe de tener una extension de 8 caracteres
  */
  final password_validation =
      RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
  print(password_validation.hasMatch('Testing123'));

  final email_validation = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  print(email_validation.hasMatch('micorreo@correo.com'));
}
