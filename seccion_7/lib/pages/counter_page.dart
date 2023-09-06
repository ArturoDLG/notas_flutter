import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Para evitar retroceder usando el boton/gesto de retroceso de Android es
    //el widget WillPopScope, el cual captura las acciones de retroceso y
    //mediante el uso de onWillPop determinar si permitimos o no navegar en la
    //interfaz por un metodo diferente a Navigator.pop
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Center(
          child: Text('counter'),
        ),
      ),
      onWillPop: () {
        print('⌛');
        return Future.value(false);
      },
    );
  }
}
