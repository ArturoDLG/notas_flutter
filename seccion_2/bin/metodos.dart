//Seccion 2
//Lecciones:
//35 - 39: Metodos
// ArturoDLG

/*
Los metodos o funciones son una caracteristica de lenguajes como Dart que nos
permiten reutilizar segmentos de codigo que hacen tareas repetitivas dentro
del programa
*/

/* 
Sintaxis de una funcion con argumentos por posicion:
tipoDato nombreFuncion(<argumentos>){
  ...
}

Nota: Los argumentos de la funcion deben de tener especificado un tipo de dato. 
Si queremos que los valores de la funcion reciban datos nulos, deberemos de 
poner delante del tipo el '?' para indicar esto.
Ejemplo:
int sum(int a, int b, int? c){ // c puede ser null
  ...
}
*/

String inverterFullName(String name, String lastname) {
  final inverter = [];
  final fullname = '$name $lastname';

  for (int index = fullname.length - 1; index >= 0; index--) {
    inverter.add(fullname[index]);
  }

  return inverter.join();
}

/*
Si queremos que nuestra funcion reciba los parametros recibiendo exclusivamente
los nombres, deberemos de usar la siguiente sintaxis:
tipoDato nombreFuncion({<argumentos>}){
  ...
}

Los argumentos deberan de especificar si son requeridos, tienen un valor por
defecto o pueden ser nulos
Ejemplo:
required int value // parametro requerido
String word : '' // valor por defecto
double? otherValue // valor nullable

Nota: Los valores por defecto solamente pueden usar valores constantes, por lo
que valores calculados en tiempo de ejecucion o clases sin constructores 
constantes no pueden ser usados. Si se quiere usar un valor por defecto con un 
valor no constante, se puede hacer lo siguiente:
Ejemplo:

DateTime? date, ...

{
  ...
  usando null-aware
  final days = current.difference(date ?? DateTime.now()); 
  si date es null entonces el valor sera DateTime.now()
}

A diferencia de los parametros por pocision, aqui el orden no importa, ya que se
especifica al llamar la funcion
*/

double calculateAge({
  required DateTime birthday,
  int precision = 1,
  bool round = false,
}) {
  final current = DateTime.now();
  final days = current.difference(birthday).inDays;
  final age = days / 365;

  if (round) {
    return age.roundToDouble();
  }
  return double.parse(
    age.toStringAsFixed(precision),
  );
}

/*
En los argumentos de una funcion, podemos combinar tanto parametros por posicion
como paramtros por nombre, de la siguiente manera:
Ejemplo:

tipoDato nombreFuncion(<argumentosPosicion>, {<argumentosNombre>}){
  ...
}
Nota: Se pueden tener argumentos opcionales por posicion, debemos de usar [] en
lugar de {}, estos deberan de respetar el orden en que son colocados, y no se 
pueden omitir, dicho de otro modo, colocas todos o dejas los valores por defecto.
*/
double discount(
  double price, {
  int percentage = 15,
  bool round = false,
}) {
  final total = price - (price * percentage / 100);
  if (round) {
    return total.roundToDouble();
  }

  return total;
}

/*
Si queremos implementar un metodo que no retorne algun valor, si no que simplemente
realice una tarea, colocamos como 'tipo de dato' a void, que le indicará a Dart
que dicha funcion no retorna valor alguno
*/
void calculateAgeFromString(String birthdayAsString) {
  final current = DateTime.now();
  final birthday = DateTime.tryParse(birthdayAsString);

  if (birthday != null) {
    final days = current.difference(birthday).inDays;
    final age = days / 365;
    print(
      double.parse(
        age.toStringAsFixed(1),
      ),
    );
  } else {
    print("✖️ Invalid date");
  }
}

void main() {
  // funciones con parametros por pocision
  final name = 'Arturo', lastname = 'DLG';

  print(
    inverterFullName(name, lastname),
  );

  // funciones con paramentros por nombre
  final birthday = DateTime(1997, 10, 10);
  final otherBirthday = DateTime(2017, 7, 28);
  // lamar a la funcion
  print(
    calculateAge(
      birthday: birthday,
      round: true,
    ),
  );

  print(
    calculateAge(
      birthday: otherBirthday,
      precision: 2,
    ),
  );

  final price = 257.0;
  print(discount(price, round: true));

  calculateAgeFromString("1997r-13-32");
}
