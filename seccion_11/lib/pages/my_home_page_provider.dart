import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seccion_11/state_management/notifier.dart';
import 'package:seccion_11/state_management/provider.dart';
import 'package:seccion_11/widgets/counter_text.dart';

import '../global/theme_controller.dart';
import '../state_management/consumer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<MyHomePageController>(
      create: () => MyHomePageController(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Consumer<ThemeController>(
              builder: (_, controller) => Switch(
                value: controller.isDarkModeEnable,
                onChanged: (_) {
                  controller.toggleTheme();
                },
              ),
            ),
            Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Provider.of<MyHomePageController>(context).increaseFontSize();
                },
                tooltip: 'Font Size',
                icon: const Icon(
                  Icons.font_download,
                ),
              );
            }),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CounterText(),
              Consumer<MyHomePageController>(
                builder: (_, controller) => Text(
                  controller.fontSize.toString(),
                  style: TextStyle(
                    fontSize: controller.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Provider.of<MyHomePageController>(context).incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}

class MyHomePageController extends ProviderNotifier {
  int _counter = 0;
  Color _color = Colors.purple;
  double _fontSize = 20;

  int get counter => _counter;
  Color get color => _color;
  double get fontSize => _fontSize;

  void incrementCounter() {
    _counter++;
    final index = Random().nextInt(
      Colors.primaries.length - 1,
    );
    _color = Colors.primaries[index];
    notify();
  }

  void increaseFontSize() {
    _fontSize++;
    notify();
  }
}
