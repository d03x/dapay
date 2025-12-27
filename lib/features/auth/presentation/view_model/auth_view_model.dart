import 'package:dapay/features/auth/providers/auth_provider.dart';
import 'package:dapay/features/auth/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends AsyncNotifier {
  @override
  void build() {
    return;
  }

  Future<void> login() async {
    Map<String, dynamic> cleanErrors = {};

    final authRepository = ref.read(authRepositoryProvider);
    final auth = ref.read(authProvider.notifier);
    state = AsyncValue.loading();
    final input = ref.watch(authLoginFormControllerProvider);
    try {
      final user = await authRepository.login(
        input.emailController.text.trim(),
        input.passwordController.text.trim(),
      );
      auth.updateState(user);
      state = const AsyncValue.data(null);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 422) {
          final Map<String, dynamic> errorData = e.response?.data;
          final Map<String, dynamic> validationErrors = errorData['errors'];
          validationErrors.forEach((key, value) {
            cleanErrors[key] = value;
          });
        } else if (e.response?.statusCode == 401) {
          cleanErrors['authentication'] = "Akun tidak ditemukan";
        } else {
          cleanErrors['global'] = "Ada kesalahan";
        }
      } else {
        cleanErrors['global'] = "Ada kesalahan";
      }
      if (cleanErrors.isEmpty) {
        cleanErrors['global'] = "Ada kesalahan";
      }
      state = AsyncValue.error(cleanErrors, e.stackTrace);
    } catch (e) {
      cleanErrors['authentication'] = e.toString();
      state = AsyncValue.error(cleanErrors, StackTrace.current);
    }
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
