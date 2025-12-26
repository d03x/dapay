import 'package:dapay/core/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductMenuItemModel {
  final String title;
  final String iconPath;
  final Color? color;

  final Function(String index) onTap;

  ProductMenuItemModel({
    this.color,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });
}

class ProductMenuItem extends StatelessWidget {
  final ProductMenuItemModel item;
  const ProductMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colors.primary;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              width: 50.w,
              height: 50.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: primaryColor.withValues(alpha: 0.1),
              ),
              child: SvgPicture.asset(
                item.iconPath,
                colorFilter: .mode(item.color ?? primaryColor, .srcIn),
                placeholderBuilder: (context) => Icon(
                  Icons.grid_view_rounded,
                  color: primaryColor,
                  size: 24.w,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 60.w,
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 9.sp,
              height: 1.2,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ).animate().fade(duration: 500.ms).move(delay: 300.ms, duration: 600.ms);
  }
}
