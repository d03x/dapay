import 'package:dapay/core/extensions/extension.dart';
import 'package:dapay/core/routers/router.dart';
import 'package:dapay/core/widgets/ui/widget_ui_input.dart';
import 'package:dapay/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLoginScreen extends ConsumerWidget {
  const AuthLoginScreen({super.key});
  Widget __loginheader(BuildContext context) {
    return Container(
      margin: .only(bottom: 20.h),
      child: Column(
        children: [
          Text("DAPAY APP", style: context.textTheme.titleMedium),
          Text(
            "Silahkan login mengunakan akun anda",
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModel);
    final isLoading = authState.isLoading;
    final controller = ref.watch(authLoginFormControllerProvider);
    String? getError(String key) {
      if (authState.hasError) {
        if (authState.error is Map<String, dynamic>) {
          final Map<String, dynamic> error =
              authState.error as Map<String, dynamic>;
          if (error.containsKey(key)) {
            if (error[key] is String) {
              return error[key];
            }
            final errorValue = error[key] as List<dynamic>;
            if (errorValue.isNotEmpty) {
              return errorValue[0];
            }
          }
        }
      }
      return null;
    }

    final authError = getError('authentication');
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: .directional(top: 20.h, bottom: 0, end: 10.w, start: 10.w),
          child: Column(
            children: [
              __loginheader(context),
              Column(
                spacing: 10.h,
                children: [
                  authError != null
                      ? Text(getError('authentication').toString())
                      : Text(""),
                  WidgetUiInput(
                    errorText: getError("email"),
                    label: "Email",
                    type: .emailAddress,
                    controller: controller.emailController,
                  ),
                  WidgetUiInput(
                    obscureText: true,
                    errorText: getError("password"),
                    label: "Passsword",
                    controller: controller.passwordController,
                  ),
                  SizedBox(
                    width: 100.sw,
                    child: !isLoading
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                            onPressed: ref.read(authViewModel.notifier).login,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : CupertinoActivityIndicator(),
                  ),
                  SizedBox(
                    width: 100.sw,
                    child: ElevatedButton(
                      onPressed: () {
                        navigatorKey.currentState!.pushNamed(
                          RouteName.register,
                        );
                      },
                      child: Text("Daftar Akun"),
                    ),
                  ),
                ],
              ),
              Container(
                margin: .only(top: 24.h),
                child: RichText(
                  text: TextSpan(
                    text: "Developed with ❤ ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: context.colors.onSurface,
                    ),
                    children: [TextSpan(text: " By Dapay")],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
