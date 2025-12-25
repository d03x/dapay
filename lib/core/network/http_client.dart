import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpClient = Provider.autoDispose((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.179.92:5173/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
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
