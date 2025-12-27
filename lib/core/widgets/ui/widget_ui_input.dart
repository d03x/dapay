import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetUiInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType type;
  final String? errorText;

  const WidgetUiInput({
    super.key,
    this.errorText,
    required this.label,
    this.controller,
    this.type = TextInputType.text,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: TextFormField(
            forceErrorText: errorText,
            controller: controller,
            keyboardType: type,
            obscureText: obscureText,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(fontSize: 14.sp), // Ukuran teks input
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(fontSize: 12.sp),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h, // Mengatur tinggi atas-bawah
                horizontal: 10.w,
              ),

              border: const OutlineInputBorder(),
              errorStyle: TextStyle(
                fontSize: 10.sp,
                color: Colors.redAccent,
                height: 1, // Jarak antar baris error
              ),
            ),
          ),
        ),
      ],
    );
  }
}
