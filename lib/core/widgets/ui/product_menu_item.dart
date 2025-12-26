import 'package:dapay/core/extensions/extension.dart';
import 'package:flutter/material.dart';
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
        // Material digunakan agar InkWell ripple effect berbentuk lingkaran
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16.r), // Radius ripple
            child: Container(
              width: 50.w, // Sedikit diperbesar agar pas jempol
              height: 50.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                // Menggunakan Squircle (Rounded Rectangle) yang lebih modern dari lingkaran penuh
                borderRadius: BorderRadius.circular(18.r),
                color: primaryColor.withValues(alpha: 0.1), // Background soft
              ),
              // Jika icon belum ada, tampilkan Icon default
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
        // Text dengan penanganan 2 baris jika kepanjangan
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
              height: 1.2, // Spasi antar baris teks
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
