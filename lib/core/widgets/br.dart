import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Br extends StatelessWidget {
  final double value;
  const Br({super.key, this.value = 7});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value.h);
  }
}
