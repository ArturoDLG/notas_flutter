//Seccion 8
//lecciones:
//186 - 187: El widget CalendarDatePicker
//ArturoDLG
import 'package:flutter/material.dart';

/*
CalendarDatePicker es un widget que nos permite seleccionar una fecha en un 
calendario. Tiene 4 parametros obligatorios:

*initialDate: fecha donde aparece a vista del calendario
*firstDate y lastDate: primera y ultima fecha seleccionable en el calendario
*onDateChanged: callback que detecta el cambio de fecha

Adicionalmente contamos con otros parametros que nos permite personalizar el 
funcionamiento del widget como:

*selectableDayPredicate: un funcion que devueleve un booleano, para mostrar 
solamente fechas que cumplna con una determinada condicion.
*initialCalendarMode: recibe un enum que nos permite seleccionar entre en tener
la vista por dias o por años al renderizar por primera vez el widget.

*/

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _initialDate, _date;

  @override
  void initState() {
    _initialDate = DateTime(1997, 10, 11);
    _date = _initialDate;
    while (!_selectableDayPredicate(_initialDate)) {
      _initialDate = _initialDate.add(
        const Duration(days: 1),
      );
      _date = _initialDate;
    }
    super.initState();
  }

  void _save() {
    if (_initialDate != _date) {
      //codigo para guardar
      print('📲 $_date');
    }
    Navigator.pop(context);
  }

  bool _selectableDayPredicate(DateTime date) => switch (date.weekday) {
        DateTime.saturday || DateTime.sunday => false,
        _ => true,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            //onPressed: _date != _initialDate ? () {} : null,
            onPressed: _save,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: SafeArea(
        child: CalendarDatePicker(
          //initialCalendarMode: DatePickerMode.year,
          initialDate: _date,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          selectableDayPredicate: _selectableDayPredicate,
          onDateChanged: (date) {
            setState(() {
              _date = date;
            });
          },
        ),
      ),
    );
  }
}
