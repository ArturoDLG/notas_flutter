import 'package:flutter/material.dart';
import 'package:seccion_10/mixins/after_first_layout_mixin.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with AfterFirstLayoutMixin {
  int _counter = 0;

  @override
  void onAfterFirtsLayout() {
    print('🏁');
  }

  @override
  Widget build(BuildContext context) {
    print('👀');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$_counter",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
      ),
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
    //el metodo addPostFrameCallback nos permite conocer cuando se ha terminado
    //de renderizar una vista
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        print('🔁');
      },
    );
  }
}
