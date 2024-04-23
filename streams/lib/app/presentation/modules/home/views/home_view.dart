import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../domain/models/notification.dart';
import '../../../../domain/repositories/notifications_repository.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _list = <AppNotification>[];
  StreamSubscription? _subscription;
  NotificationsRepository? _notificationsRepository;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
  }

  void _init() async {
    _notificationsRepository = Provider.of(context).notificationsRepository;
    // await Future.delayed(
    //   const Duration(seconds: 5),
    // );
    _subscription = _notificationsRepository?.onNotification.listen(
      (event) {
        setState(() {
          _list.add(event);
        });
      },
    );
  }

  @override
  void dispose() {
    //_subscription?.cancel();
    _notificationsRepository?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(
                      child: Text('Out'),
                    ),
                  ),
                ),
              );
              // }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (_, index) {
          final notification = _list[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.body),
          );
        },
      ),
    );
  }
}
