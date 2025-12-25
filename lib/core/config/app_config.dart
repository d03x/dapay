import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfig {
  final String apiUrl;
  final int apiTimeout;
  final String appName;

  AppConfig({
    required this.apiTimeout,
    required this.apiUrl,
    required this.appName,
  });

  factory AppConfig.fromEnv() {
    return AppConfig(
      apiUrl: dotenv.env['API_URL'] ?? 'http://localhost:8000/api',
      appName: dotenv.env['APP_NAME'] ?? 'Dapay App',
      apiTimeout: int.parse(dotenv.env['API_TIMEOUT'] ?? '30000'),
    );
  }
}

final configProvider = Provider.autoDispose((ref) {
  return AppConfig.fromEnv();
});
