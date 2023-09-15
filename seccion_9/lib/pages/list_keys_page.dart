//Seccion 9: 193.- Preservar el estado dentro de widgets tipo lista
//ArturoDLG
import 'package:flutter/material.dart';
import 'package:seccion_9/widgets/counter_button.dart';

/*
Otro uso de los keys, es el preservar el estado de los widgets que se renderizan
de las listas (Row, Column, ListView, etc.). Un ejemplo de esto es cuando
dejamos de renderizar un widget o lo volvemos a renderizar (dicho de otra forma,
que cambiamos su posición), sin el uso de keys, Flutter no sabe que estado darle, 
por lo que puede pasarle el valor de otro widget que estaba en la misma posicion 
(cuando son widgets del mismo tipo) o resetearlo.

Usando keys, permite a Flutter que los widgets que siguen renderizados en 
pantalla conserven su valor aunque no permanenzca en su misma posicion.

Para este caso, los keys de tipo UniqueKey, no son utiles, ya que al volver a 
renderizar la vista. UniqueKey genera un nuevo valor que no esta relacionado
con el anterior, perdiendo asi el estado del widget. 
*/

class ListKeyPage extends StatefulWidget {
  const ListKeyPage({super.key});

  @override
  State<ListKeyPage> createState() => _ListKeyPageState();
}

class _ListKeyPageState extends State<ListKeyPage> {
  bool _enableEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        actions: [
          Switch(
            value: _enableEmail,
            onChanged: (value) {
              setState(() {
                _enableEmail = value;
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          if (_enableEmail)
            const TextField(
              decoration: InputDecoration(
                label: Text('Email'),
              ),
            ),
          const TextField(
            key: Key('password'),
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          if (_enableEmail) const CounterButton(),
          const CounterButton(
            key: Key('counter2'),
          ),
        ],
      ),
    );
  }
}

/*
Nota:
La preservacion de estado de un widget solamente puede ser usado en 
StateFulWidget, puesto a que los StateLessWidgets, estos siempre serán 
renderizados con su valor asignado. 

Una restriccion de los keys para preservar su estado es que deben de tener una
clave unica, pues de lo contrario causaria un conflicto en Flutter y no
puede preservar el valor.
*/