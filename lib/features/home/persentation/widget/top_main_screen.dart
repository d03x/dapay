import 'package:custom_clippers/custom_clippers.dart';
import 'package:dapay/core/extensions/extension.dart';
import 'package:dapay/features/home/persentation/widget/card_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMainScreen extends StatelessWidget {
  const TopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardPosition = 70.h;
    return Stack(
      clipBehavior: .none,
      children: [
        Positioned(
          child: ClipPath(
            clipper: SinCosineWaveClipper(),
            child: Container(
              width: 100.sw,
              height: 180.h,
              decoration: BoxDecoration(
                color: context.colors.surface,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/006/960/486/large_2x/ramadan-mubarak-islamic-arabic-green-luxury-background-with-geometric-pattern-and-beautiful-ornament-vector.jpg',
                  ),
                  fit: BoxFit.cover, // Memenuhi seluruh area container
                  // colorFilter opsional: untuk membuat gambar menyatu dengan warna primary
                  colorFilter: ColorFilter.mode(
                    context.colors.primary.withValues(alpha: 0.9),
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          top: 13.h,
          right: 10.w,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  spacing: 10.w,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150",
                        ),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Teks di tengah secara vertikal
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Teks rata kiri
                      children: [
                        Text(
                          "Selamat Pagi",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "Dadan Hidayat",
                          maxLines: 1, // Batasi 1 baris
                          overflow: TextOverflow
                              .ellipsis, // Kalau nama panjang jadi "Dadan Hida..."
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  spacing: 0,
                  children: [
                    IconButton(
                      iconSize: 19.h,
                      color: context.colors.onPrimary,
                      onPressed: () {},
                      icon: Icon(LucideIcons.bell),
                    ),
                    IconButton(
                      iconSize: 19.h,

                      color: context.colors.onPrimary,
                      onPressed: () {},
                      icon: Icon(LucideIcons.message_circle),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: cardPosition,
          child: SizedBox(
            height: 130.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: .only(left: 10.w, right: 10.w),
              child: CardMenu(),
            ),
          ),
        ),
      ],
    );
  }
}
