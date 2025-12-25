import 'package:dapay/core/local_storage/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//firebase
final firebaseAuthProvider = Provider.autoDispose<FirebaseAuth>((ref) {
  throw UnimplementedError("Firebase: Provider not implement");
});
/**
 * firebase auth state
 */
final firebaseAuthStateProvider = FutureProvider.autoDispose((ref) async {
  final storage = ref.watch(storageProvider);
  final data = await storage.get("token");
  return data;
});
