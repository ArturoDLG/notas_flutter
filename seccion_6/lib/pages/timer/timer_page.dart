//Seccion 6
//Lecciones:
//140: Periodic Timer
//141: Liberar recursos con dispose
//142: didUpdateWidget
// ArturoDLG
import 'dart:async';
import 'package:flutter/material.dart';

/*
Cuando nosotros utilizamos un StatefulWidget que utiliza recursos como un timer,
una conexion a un socket o similares, es necesario que implementemos el metodo 
dispose, el cual se llama cuando el widget se deja de renderizar en pantalla. Es
ahi donde tenemos que liberar los recursos que estamos usando para no tener 
perdida de rendimiento en la app. 
*/

class TimerView extends StatefulWidget {
  final Color color;
  const TimerView({
    super.key,
    required this.color,
  });

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int _time = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    print('⚡');
    //ejecutamos un callback cada 1 segundo
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        _time++;
        setState(() {});
      },
    );
  }

  /*
  Cuando sobreescribimos un metodo de una clase padre, podemos cambiar el tipo 
  de dato de este utilizando la palabra "covariant", el cual le indica al 
  compilador que este cambio es intencional. 
  */

  /*
  didUpdateWidget nos permite hacer comparaciones en el estado actual del widget
  comparado al estado anterior. 
  */
  @override
  void didUpdateWidget(covariant TimerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.color != widget.color) {
      print('🎨');
      _time = 0;
    }

    print("old: ${oldWidget.color}");
    print("new: ${widget.color}");
  }

  @override
  void dispose() {
    print('timer dispose');
    //verificamos que _Timer no sea nulo
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('timer build');
    return Text(
      '$_time',
      style: TextStyle(
        fontSize: 50,
        color: widget.color,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showTimer = true;
  Color _color = Colors.primaries.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_showTimer)
              TimerView(
                color: _color,
              ),
            Expanded(
                child: ListView.builder(
              itemCount: Colors.primaries.length,
              itemBuilder: (_, index) {
                final color = Colors.primaries[index];
                return GestureDetector(
                  onTap: () {
                    _color = color;
                    setState(() {});
                  },
                  child: Container(
                    color: color,
                    height: 50,
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTimer = !_showTimer;
          setState(() {});
        },
      ),
    );
  }
}
