part of "alert.dart";

class NotifiedBanner extends StatelessWidget {
  const NotifiedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        borderRadius: .all(.circular(15.sp)),
        color: context.colors.primary.withValues(alpha: 0.4),
        border: .all(color: context.colors.primary.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        borderRadius: .all(.circular(15.sp)),
        onTap: () {},
        child: Stack(
          children: [
            Positioned(
              bottom: 35,
              right: 305.w,
              child: Icon(
                LucideIcons.info,
                color: context.colors.primary.withValues(alpha: 0.3),
                size: 50.w,
              ),
            ),
            Padding(
              padding: .only(left: 10.w, right: 2.w, top: 10.h, bottom: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Akunmu belum lengkap nih. Verifikasi data dirimu sekarang untuk nikmati limit saldo lebih besar dan bebas transfer ke mana aja.",
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      LucideIcons.circle_chevron_right,
                      color: context.colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
