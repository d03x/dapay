import 'package:dapay/features/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePersentationUi extends ConsumerWidget {
  const HomePersentationUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shape: BeveledRectangleBorder(
          borderRadius: .only(
            bottomLeft: .circular(10.r),
            bottomRight: .circular(10.r),
          ),
        ),
        foregroundColor: colors.onPrimary,
        backgroundColor: colors.primary,
        shadowColor: colors.primary,
        title: Text("DA-PAY"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
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
              onPressed: () async {
                await ref.read(authProvider.notifier).logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
