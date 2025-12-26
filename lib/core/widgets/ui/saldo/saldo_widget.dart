import 'package:dapay/core/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

part "saldo_widget_provider.dart";

class SaldoWidget extends ConsumerWidget {
  final int saldo;
  final String rekening;
  const SaldoWidget({super.key, required this.saldo, required this.rekening});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saldoState = ref.watch(saldoWidgetProvider);
    return Row(
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
                color: context.colors.onSurface.withValues(alpha: 0.7),
              ),
            ),
            Column(
              crossAxisAlignment: .start,
              children: [
                saldoState
                    ? Text(
                        saldo.toIDR(),
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: .w800,
                          fontSize: 18.sp,
                          fontFamily: GoogleFonts.barlow().fontFamily,
                          fontFeatures: [const FontFeature.tabularFigures()],
                        ),
                      ).animate().fade()
                    : Text(
                        int.parse(
                          saldo
                              .toString()
                              .split("")
                              .map((e) {
                                return "8";
                              })
                              .join(""),
                        ).toIDR(),
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: .w800,
                          fontSize: 18.sp,
                          fontFamily: GoogleFonts.barlow().fontFamily,
                          fontFeatures: [const FontFeature.tabularFigures()],
                        ),
                      ).animate().blur().fade(duration: 500.ms),
                Text(
                  rekening,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.barlow().fontFamily,
                    fontFeatures: [const FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            ref.read(saldoWidgetProvider.notifier).toggle();
          },
          icon: Icon(saldoState ? LucideIcons.eye_off : LucideIcons.eye),
          color: context.colors.primary,
        ).animate().fade(duration: 500.ms),
      ],
    );
  }
}
