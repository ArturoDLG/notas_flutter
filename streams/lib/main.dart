import 'package:flutter/material.dart';

import 'app/data/repositories_impl/notifications_repository_impl.dart';
import 'app/domain/repositories/notifications_repository.dart';
import 'app/presentation/modules/builder/views/builder_view.dart';

void main() {
  runApp(
    Provider(
      notificationsRepository: NotificationsRepositoryImpl(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
        ),
      ),
      home: const BuilderView(),
    );
  }
}

/// Widget para inyectar la dependencia en la app
class Provider extends InheritedWidget {
  final NotificationsRepository notificationsRepository;

  const Provider({
    super.key,
    required super.child,
    required this.notificationsRepository,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static Provider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!;
  }
}
