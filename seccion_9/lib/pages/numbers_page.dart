//Seccion 9: 194.- El widget ReorderableListView
//ArturoDLG
import 'package:flutter/material.dart';

/*
Un widget que nos permite reordenar elementos de una lista, es 
ReorderableListView, el cual es similar a ListView, pero usa un callback 
onReorder, que recibe la posicion actual del widget que movemos y la nueva
posicion a ocupar, para asi poder reubicar el wiget. En este widget debemos de
usar keys para preservar su estado. 
*/

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final List<int> _numbers = [];

  @override
  void initState() {
    _numbers.addAll(
      List.generate(100, (index) => index),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              print('oldIndex: $oldIndex');
              print('newIndex: $newIndex');

              if (oldIndex < newIndex) {
                newIndex = newIndex - 1;
              }
              final item = _numbers.removeAt(oldIndex);
              _numbers.insert(newIndex, item);
            },
            itemCount: _numbers.length,
            itemBuilder: (_, index) {
              final value = _numbers[index];
              return ListTile(
                key: ValueKey(value),
                title: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
