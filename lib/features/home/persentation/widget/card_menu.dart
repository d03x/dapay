import 'package:dapay/core/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: .antiAlias,
      elevation: 1,
      color: context.colors.surface,
      borderRadius: .all(.circular(10.r)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: .only(left: 10.w, right: 10.w, top: 10.h),
              width: 100.sw,
              child: Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .start,
                children: [
                  Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Saldo DaPay Anda",
                        style: context.textTheme.labelMedium!.copyWith(
                          fontWeight: .w500,
                          color: context.colors.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            110_000.toIDR(),
                            style: context.textTheme.titleMedium!.copyWith(
                              fontWeight: .w800,
                              fontSize: 18.sp,
                              fontFamily: GoogleFonts.barlow().fontFamily,
                              fontFeatures: [
                                const FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                          Text(
                            "DP-827635293",
                            style: context.textTheme.titleMedium!.copyWith(
                              fontSize: 12.sp,
                              fontFamily: GoogleFonts.barlow().fontFamily,
                              fontFeatures: [
                                const FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(LucideIcons.eye_off),
                    color: context.colors.primary,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: .only(left: 10.w, right: 10.w),
              child: Flex(
                spacing: 10,
                direction: .horizontal,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(
                        LucideIcons.diamond_plus,
                        color: context.colors.onPrimary.withValues(alpha: 0.8),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: .all(0),
                        shape: .all(
                          RoundedRectangleBorder(
                            borderRadius: .all(.circular(5.r)),
                          ),
                        ),
                        backgroundColor: .all(context.colors.primary),
                      ),
                      label: Text(
                        "TopUp",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colors.onPrimary.withValues(
                            alpha: 0.8,
                          ),
                          fontWeight: .w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(
                        LucideIcons.send_horizontal,
                        color: context.colors.onPrimary,
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: .all(0),
                        shape: .all(
                          RoundedRectangleBorder(
                            borderRadius: .all(.circular(5.r)),
                          ),
                        ),
                        backgroundColor: .all(
                          context.colors.inverseSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      label: Text(
                        "Tarik Saldo",
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colors.onPrimary.withValues(
                            alpha: 0.8,
                          ),
                          fontWeight: .w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
