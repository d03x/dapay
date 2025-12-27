import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage(aOptions: AndroidOptions());

  Future<void> write(String key, String? value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

final storageProvider = Provider<StorageService>((ref) {
  return StorageService();
});
