import 'package:dapay/core/local_storage/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {}

final firebaseAuthStateProvider = FutureProvider.autoDispose((ref) async {
  final storage = ref.watch(storageProvider);
  final data = await storage.get("token");
  print(data);
  return data;
});
