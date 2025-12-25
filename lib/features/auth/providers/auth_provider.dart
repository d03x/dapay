import 'package:dapay/core/local_storage/storage_service.dart';
import 'package:dapay/features/auth/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState extends Equatable {
  final String? token;
  final String? refreshToken;
  final bool? isActivation;
  const AuthState({this.refreshToken, this.token, this.isActivation});

  AuthState copyWith({String? token, String? refreshToken}) {
    return AuthState(
      refreshToken: refreshToken ?? this.refreshToken,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [token, refreshToken, isActivation];
}

class AuthProvider extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    final storage = ref.watch(storageProvider);
    final isAuth = await storage.get('token');
    final refreshToken = await storage.get('token');
    return AuthState(token: isAuth, refreshToken: refreshToken);
  }

  //////// FUNGSI
  Future<void> updateState(UserModel user) async {
    final storageService = ref.read(storageProvider);
    state = const AsyncValue.loading();
    storageService.write('token', user.token);
    storageService.write('refresh_token', user.refreshToken);
    state = await AsyncValue.guard(() async {
      return AuthState(token: user.token, refreshToken: user.refreshToken);
    });
  }

  ///////// FUNGSI LOGOUT
  Future<void> logout() async {
    final storage = ref.watch(storageProvider);
    state = AsyncValue.loading();
    await storage.delete('token');
    state = await AsyncValue.guard(() async {
      return AuthState(token: null, refreshToken: null);
    });
  }
}

final authProvider = AsyncNotifierProvider.autoDispose<AuthProvider, AuthState>(
  () {
    return AuthProvider();
  },
);
