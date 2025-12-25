import 'package:dapay/core/extensions/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpClient = Provider.autoDispose((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ref.config.apiUrl,
      connectTimeout: Duration(milliseconds: ref.config.apiTimeout),
      receiveTimeout: Duration(milliseconds: ref.config.apiTimeout),
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ),
  );
  return dio;
});
