import 'package:dapay/core/providers/theme_provider.dart';
import 'package:dapay/core/routers/router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ref.watch(themeProvider);
    return MaterialApp(
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blueM3,
        appBarElevation: 0,
      ),
      navigatorKey: navigatorKey,
      theme: FlexThemeData.light(
        scheme: FlexScheme.blueM3,
        appBarElevation: 4,
        appBarStyle: FlexAppBarStyle.primary,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: colorScheme.themeMode,
      initialRoute: RouteName.root,
      onGenerateRoute: RouterUtils.generateRoute,
    );
  }
}
