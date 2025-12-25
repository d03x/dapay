import 'package:dapay/features/auth/providers/auth_provider.dart';
import 'package:dapay/features/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends AsyncNotifier {
  @override
  void build() {
    return;
  }

  Future<void> login() async {
    final authRepository = ref.read(authRepositoryProvider);
    final auth = ref.read(authProvider.notifier);
    state = AsyncValue.loading();
    final input = ref.watch(authLoginFormControllerProvider);
    state = await AsyncValue.guard(() async {
      try {
        final user = await authRepository.login(
          input.emailController.text.trim(),
          input.passwordController.text.trim(),
        );
        auth.updateState(user);
      } on FirebaseAuthException catch (e) {
        state = AsyncValue.error(e.toString(), StackTrace.current);
      }
    });
  }
}

class AuthLoginFormController {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  AuthLoginFormController({
    required this.emailController,
    required this.passwordController,
  });
}

final authLoginFormControllerProvider =
    Provider.autoDispose<AuthLoginFormController>((ref) {
      final passwordConroller = TextEditingController();
      final passwordController = TextEditingController();
      ref.onDispose(() {
        passwordConroller.dispose();
        passwordController.dispose();
      });
      return AuthLoginFormController(
        emailController: passwordConroller,
        passwordController: passwordController,
      );
    });
final authViewModel = AsyncNotifierProvider.autoDispose<AuthViewModel, dynamic>(
  () {
    return AuthViewModel();
  },
);
