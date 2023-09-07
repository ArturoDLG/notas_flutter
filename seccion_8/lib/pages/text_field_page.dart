//Seccion 8
//lecciones:
//167: El widget TextField
//168: Esconder el teclado del dispositivo movil
//169: PrimarySwatch
//170: inputDecoration
//173: textEditingController
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_8/constants/countries.dart';
import 'package:seccion_8/models/country.dart';

/*
TextField es un widget que nos permite ingresar texto desde el teclado de 
nuestro, dispositivo movil.

Si queremos registrar lo que hemos ingresado en el TextField, basta con usar el 
callback Onchanged, que recibe por parametro el texto ingresado y de ahi podremos
elegir que hacer con dicha informacion.

Para personalizar el color del borde de TextField de manera sencilla, basta con 
pasar un MaterialColor a el parametro swatch de theme en MaterialApp 
(ver main.dart).

Si queremos sobreescribir el estilo de nuestro TextField, podemos hacerlo 
mediante el uso del parametro decoration, usando una instancia de 
InputDecoration. Alguno de los parametros que podemos definir son:
* label: Widget que aparece cuando el enfoque no esta en el TextField, sirve
un apoyo visual al usuario de que puede hacer con el TextField.

* hintText: Texto base que ayuda al usario a conocer que informacion recibe el 
TextField. para personalizar dicho texto tenemos el parametro hintStyle.

* prefixIcon/suffixIcon: Estos parametros permiten agregar un widget en la parte 
izquierda y derecha respectivamente, dentro de nuestro TextField.

* contentPadding: Define el padding del widget.

* focusedBorder/enableBorder/disableBorder: Estos parametros nos permiten 
personalizar el estilo del borde en los siguientes estados del TextField: 
  * Cuando el foco esta en el TextField
  * Cuando se encuentra habilitado el TextField para recibir datos (sin foco)
  * Cuando se encuentra deshabilitado el TextField

Todos estos y otros parametros de tipo -Border reciben una instancia de la clase
padre InputBorder.

Nosotros podemos manejar el comportamiento del texto de nuestro TextField usando
un TextEditingController. Esta clase se agrega dentro del parametro controller y 
nos permite ver lo que se esta escribiendo mediante su getter/setter text, por 
lo que no dependeremos de usar una variable externa para hacer esto.
*/

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  late final List<Country> _countries;
  //String _query = '';
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    _countries = countries
        .map(
          (e) => Country.fromJson(e),
        )
        .toList();
    // _textEditingController.addListener(
    //   () {
    //     print('👂🏻');
    //   },
    // );
    _textEditingController.text = 'Mex';
    super.initState();
  }

  @override
  void dispose() {
    //liberar los recursos del controlador
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final List<Country> filteredList;
    final query = _textEditingController.text;
    if (query.isEmpty) {
      filteredList = _countries;
    } else {
      filteredList = _countries
          .where(
            (e) => e.name.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            label: const Text('Search country...'),
            hintText: 'Example: México',
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {
                _textEditingController.text = '';
                FocusScope.of(context).unfocus();
                //setState(() {});
              },
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff1565C0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
          //desctivar el TextField
          //enabled: false,
          //controlador del textField
          controller: _textEditingController,
          onChanged: (_) {
            setState(() {});
          },
        ),
      ),
      body: ListView.builder(
        //ocultar el teclado al hacer scroll
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: filteredList.length,
        itemBuilder: (_, index) {
          final country = filteredList[index];
          return ListTile(
            title: Text(country.name),
          );
        },
      ),
    );
  }
}
/*
Nota:
Podemos ocultar el teclado del dispositivo utilzando 
FocusScope.of(context).unfocus(), agregandolo en el metodo onTap de un 
GestureDetector que envuelva al widget que queremos visualizar.

Para hacer esto en todas las pantallas, basta con envolver a MaterialApp con el
GestureDetector e implementar lo encontrado en main.dart.

Si solo definimos el paramtro border en los estilos de borde de TextField, este 
estilo se aplicará para demas paramtros de este tipo. 
*/
