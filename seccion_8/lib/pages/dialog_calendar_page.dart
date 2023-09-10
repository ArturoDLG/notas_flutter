//Seccion 8: 189. Date y Time pickers mediante dialogos
//ArturoDLG
import 'package:flutter/material.dart';

/*
Podemos mostrar un CalendarPicker y un TimerPicker (un selector que permite 
seleccionar una hora y minuto del dia) a traves de Dialogos, con las funciones
showDatePicker y showTimePicker, que generan un Dialog como los vistos en la
seccion 7.

Estos dialogos funcionan de manera similar a el widget CalendarDatePicker en 
cuanto a los parametros (fecha inicial, minima, maxima y callback de cambio
de fecha) con la diferencia que usan diferentes tipos de datos (showDatePicker
usa DateTime y showTimePicker usa TimeOfDay). De igual manera ambos Dialogs 
cuentan con parametors de personalizacion como el modo de input, o modificar los
textos de las diferentes etiquetas.
*/

class DialogCalendarPage extends StatefulWidget {
  const DialogCalendarPage({super.key});

  @override
  State<DialogCalendarPage> createState() => _DialogCalendarPageState();
}

class _DialogCalendarPageState extends State<DialogCalendarPage> {
  late DateTime _date;
  late TimeOfDay _time;

  @override
  void initState() {
    _date = DateTime(1997, 10, 10);
    _time = TimeOfDay.now();
    super.initState();
  }

  Future<void> _selectDay() async {
    final date = await showDatePicker(
      context: context,
      builder: (context, child) => WillPopScope(
        child: child!,
        onWillPop: () async => false,
      ),
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.input,
    );
    setState(() {
      _date = date ?? _date;
    });
  }

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      builder: (_, child) {
        return WillPopScope(
          child: child!,
          onWillPop: () async => false,
        );
      },
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      hourLabelText: "Horas",
      minuteLabelText: "Minutos",
    );
    setState(() {
      _time = time ?? _time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _selectDay,
            icon: const Icon(Icons.calendar_month),
          ),
          IconButton(
            onPressed: _selectTime,
            icon: const Icon(Icons.alarm),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🗓️ $_date',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 75),
            Text(
              '⌚ ${_time.hour} : ${_time.minute}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
