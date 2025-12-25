import 'package:dapay/core/app.dart';
import 'package:dapay/core/providers/shared_preferences_provider.dart';
import 'package:dapay/core/widgets/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //load env
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  //initalize firebase
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  const designSize = Size(360, 690);
  ErrorWidget.builder = (details) {
    return CustomErrorScreen(errorDetails: details);
  };
  //RUN APP
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return App();
        },
      ),
    ),
  );
}
