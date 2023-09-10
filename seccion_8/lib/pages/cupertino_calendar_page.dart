//Seccion 8: 188. El widget CalendarDatePicker
//ArturoDLG
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
CupertinoCalendarPicker, es un widget de calendario con el estilo cupertino, el 
cual nos deja seleccionar fechas y/u horas.

Sun funcionamiento es muy similar a CalendarDatePicker, teniendo parametros como
minimunDate y maximunDate que nos permiten seleccionar un rango de fechas/horas,
asi como la fecha/hora inicial donde se posiciona el widget con initialDate.
Tambien cuenta con un callback onDateTimeChanged que le permite capturar los 
cambios de fecha/hora del widget. Adicionalmente cuenta con un parametro mode
que permite seleccionar el modo de vista del widget a traves de un enum
CupertinoDatePickerMode.
*/

class CupertinoCalendarPage extends StatefulWidget {
  const CupertinoCalendarPage({super.key});

  @override
  State<CupertinoCalendarPage> createState() => _CupertinoCalendarPageState();
}

class _CupertinoCalendarPageState extends State<CupertinoCalendarPage> {
  late DateTime _date;

  @override
  void initState() {
    _date = DateTime(2023);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _date,
                minimumDate: DateTime(2000),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (date) {
                  setState(() {
                    _date = date;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
