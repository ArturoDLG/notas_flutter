//Seccion 2
//Lecciones:
//26: if - else
//27: condicionales
// ArturoDLG

/*
Los flujos condicionales nos permite ejecutar un segmento de codigo mientras
se cumpla una condicion, la cual es una expresion booleana (que devuelve 
verdadero o falso).
*/
void main() {
  final email = 'micorreo@micorreo.com';

  /*
  El bloque if - else nos permite manejar el flujo del codigo mediante 
  condiciones.

  - if() inicia el bloque y entre parentesis lleva la expresion a cumplir
  
  - else if() es un bloque que se ejecuta si la condicion del if es falsa y
  la condicion de este es verdadera, se pueden escribir tantos bloques de estos
  se desean 
  
  - else es un bloque que se coloca para ejecutar codigo si es que las condiciones
  anteriores son falsas
  */

  if (email.contains('@')) {
    // el bloque de codigo se ejecuta solo si la condicion de arriba es verdadera
    print('Valid email');
  } else if (email.endsWith('.com')) {
    print('missing @');
  } else {
    // el bloque de codigo se ejecuta solo si las demas condiciones son falsas
    print('Invalid email');
  }

  // uso de if else mas avanzado

  final weekDay = 5;

  if (weekDay >= 1 && weekDay <= 7) {
    // uso del operador and
    //if anidado
    if (weekDay == 6 || weekDay == 7) {
      // uso del operador or
      print('day off');
    } else {
      print('🥵');
    }
  } else {
    print('Invalid week day');
  }

  /*
  Nota: en las expresiones de condicion, podemos hacer uso de comparadores y 
  operadores booleanos como los siguientes:
  - > : mayor que
  - >= : mayor o igual que
  - < : menor que
  = <= : menor o igual que
  - == : igual que
  - != : diferente que
  - && : AND
  - || : OR
  - ! : NOT

  */
}
