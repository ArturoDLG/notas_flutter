import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../domain/models/notification.dart';

class BuilderView extends StatelessWidget {
  const BuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
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
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<AppNotification>(
              // initialData: AppNotification(
              //   title: 'Default',
              //   body: '',
              //   createdAt: DateTime.now(),
              // ),
              stream:
                  Provider.of(context).notificationsRepository.onNotification,
              builder: (_, snapshot) {
                if (snapshot.data != null) {
                  return ListTile(
                    title: Text(snapshot.data!.title),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
