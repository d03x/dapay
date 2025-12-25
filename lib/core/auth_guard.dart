import 'package:dapay/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:dapay/features/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends ConsumerWidget {
  final Widget child;
  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authProvider);
    return authStateAsync.when(
      data: (data) {
        if (data.token != null) {
          return child;
        }
        return AuthLoginScreen();
      },
      error: (error, stackTrace) {
        return Text("ERROR");
      },
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
