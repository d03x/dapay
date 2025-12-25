import 'package:dapay/core/auth_guard.dart';
import 'package:dapay/core/screens/main_screen.dart';
import 'package:dapay/core/widgets/widget.dart';
import 'package:dapay/features/auth/presentation/screens/auth_register_screen.dart';
import 'package:flutter/material.dart';

part 'route_name.dart';
part "router_nav_key.dart";

class RouterUtils {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.root:
        return MaterialPageRoute(
          builder: (context) => AuthGuard(child: MainScreen()),
        );
      case RouteName.register:
        return MaterialPageRoute(builder: (context) => AuthRegisterScreen());
      default:
        return MaterialPageRoute(builder: (context) => AuthWrapper());
    }
  }
}
