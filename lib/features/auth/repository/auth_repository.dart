import 'package:dapay/core/network/http_client.dart';
import 'package:dapay/features/auth/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

  Future<UserModel> login(String email, String password) async {
    final data = await dio.post(
      "api.php?endpoint=auth&type=login",
      data: FormData.fromMap({"email": email, "password": password}),
    );
    return UserModel.fromJson(data.data);
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepository(dio: ref.watch(httpClient));
});
