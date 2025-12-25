import 'package:dapay/core/local_storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePersentationUi extends ConsumerWidget {
  const HomePersentationUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(storageProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .start,
              children: [],
            ),
            ElevatedButton(
              onPressed: () {
                user.delete('token');
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
