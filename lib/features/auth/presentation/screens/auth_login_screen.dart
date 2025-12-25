import 'package:dapay/core/widgets/ui/widget_ui_input.dart';
import 'package:dapay/features/auth/presentation/view_model/auth_view_model.dart';
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
          Text("DAPAY APP", style: Theme.of(context).textTheme.titleMedium),
          Text(
            "Silahkan login mengunakan akun anda",
            style: Theme.of(context).textTheme.labelMedium,
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
    ref.listen(authViewModel, (prevous, next) {
      if (next is AsyncError) {
        final errorMessage = next.error.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(errorMessage)),
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .directional(top: 20.h, bottom: 0, end: 10.w, start: 10.w),
          child: Column(
            children: [
              __loginheader(context),
              Column(
                spacing: 10.h,
                children: [
                  WidgetUiInput(
                    label: "Email",
                    type: .emailAddress,
                    controller: controller.emailController,
                  ),
                  WidgetUiInput(
                    obscureText: true,
                    label: "Passsword",
                    controller: controller.passwordController,
                  ),
                  SizedBox(
                    width: 100.sw,
                    child: !isLoading
                        ? ElevatedButton(
                            onPressed: ref.read(authViewModel.notifier).login,
                            child: Text("Login"),
                          )
                        : CircularProgressIndicator.adaptive(),
                  ),
                  SizedBox(
                    width: 100.sw,
                    child: ElevatedButton(
                      onPressed: ref.read(authViewModel.notifier).login,
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
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
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
