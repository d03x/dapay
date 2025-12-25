import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRegisterScreen extends ConsumerWidget {
  const AuthRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SafeArea(child: Text("Register")),
    );
  }
}
