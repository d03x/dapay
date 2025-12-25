import 'package:dapay/core/local_storage/storage_service.dart';
import 'package:dapay/features/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends AsyncNotifier {
  @override
  void build() {
    return;
  }

  void _resetForm() {
    final input = ref.watch(authLoginFormControllerProvider);
    input.emailController.clear();
    input.passwordController.clear();
  }

  Future<void> login() async {
    final authRepository = ref.read(authRepositoryProvider);
    final storageService = ref.read(storageProvider);
    state = AsyncValue.loading();
    final input = ref.watch(authLoginFormControllerProvider);
    state = await AsyncValue.guard(() async {
      try {
        final user = await authRepository.login(
          input.emailController.text.trim(),
          input.passwordController.text.trim(),
        );
        //write token to storage
        storageService.write('token', user.token);
        storageService.write('refresh_token', user.refreshToken);
      } on FirebaseAuthException catch (e) {
        state = AsyncValue.error(e.toString(), StackTrace.current);
      }
    });
  }
}

class AuthLoginFormController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}

final authLoginFormControllerProvider =
    Provider.autoDispose<AuthLoginFormController>((ref) {
      return AuthLoginFormController();
    });
final authViewModel = AsyncNotifierProvider.autoDispose<AuthViewModel, dynamic>(
  () {
    return AuthViewModel();
  },
);
