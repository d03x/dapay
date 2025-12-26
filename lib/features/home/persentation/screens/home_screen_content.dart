import 'package:dapay/core/extensions/extension.dart';
import 'package:dapay/features/home/persentation/widget/top_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenContent extends ConsumerWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.colors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopMainScreen(),
              Container(
                margin: .only(top: 30.h),
                child: Text(
                  'Apa saja yang saya ubah? Struktur Stack: Saya mengeluarkan Container Kartu Saldo dari ClipPath. Sekarang ClipPath hanya memotong background biru tua saja, sedangkan Kartu Putih berada di layer atasnya (Positioned paling bawah di kode). Gradient Color: Mengganti warna merah polos (Colors.red) menjadi Gradient Biru agar terlihat lebih modern. Shadow & Radius: Menambahkan BoxShadow dan borderRadius pada kartu putih agar terlihat floating (mengambang) dan tidak kaku. Height Management: Saya memberikan height: 320.h pada parent container agar ada ruang bagi kartu putih untuk "keluar" sedikit dari area background biru. Mock Data: Menambahkan layout saldo dan tombol (Top Up, Transfer) agar nuansa Fintech-nya langsung terasa. Apakah tampilan ini sudah sesuai dengan bayangan Fintech yang kamu maksud?Apa saja yang saya ubah? Struktur Stack: Saya mengeluarkan Container Kartu Saldo dari ClipPath. Sekarang ClipPath hanya memotong background biru tua saja, sedangkan Kartu Putih berada di layer atasnya (Positioned paling bawah di kode). Gradient Color: Mengganti warna merah polos (Colors.red) menjadi Gradient Biru agar terlihat lebih modern. Shadow & Radius: Menambahkan BoxShadow dan borderRadius pada kartu putih agar terlihat floating (mengambang) dan tidak kaku. Height Management: Saya memberikan height: 320.h pada parent container agar ada ruang bagi kartu putih untuk "keluar" sedikit dari area background biru. Mock Data: Menambahkan layout saldo dan tombol (Top Up, Transfer) agar nuansa Fintech-nya langsung terasa. Apakah tampilan ini sudah sesuai dengan bayangan Fintech yang kamu maksud?Apa saja yang saya ubah? Struktur Stack: Saya mengeluarkan Container Kartu Saldo dari ClipPath. Sekarang ClipPath hanya memotong background biru tua saja, sedangkan Kartu Putih berada di layer atasnya (Positioned paling bawah di kode). Gradient Color: Mengganti warna merah polos (Colors.red) menjadi Gradient Biru agar terlihat lebih modern. Shadow & Radius: Menambahkan BoxShadow dan borderRadius pada kartu putih agar terlihat floating (mengambang) dan tidak kaku. Height Management: Saya memberikan height: 320.h pada parent container agar ada ruang bagi kartu putih untuk "keluar" sedikit dari area background biru. Mock Data: Menambahkan layout saldo dan tombol (Top Up, Transfer) agar nuansa Fintech-nya langsung terasa. Apakah tampilan ini sudah sesuai dengan bayangan Fintech yang kamu maksud?Apa saja yang saya ubah? Struktur Stack: Saya mengeluarkan Container Kartu Saldo dari ClipPath. Sekarang ClipPath hanya memotong background biru tua saja, sedangkan Kartu Putih berada di layer atasnya (Positioned paling bawah di kode). Gradient Color: Mengganti warna merah polos (Colors.red) menjadi Gradient Biru agar terlihat lebih modern. Shadow & Radius: Menambahkan BoxShadow dan borderRadius pada kartu putih agar terlihat floating (mengambang) dan tidak kaku. Height Management: Saya memberikan height: 320.h pada parent container agar ada ruang bagi kartu putih untuk "keluar" sedikit dari area background biru. Mock Data: Menambahkan layout saldo dan tombol (Top Up, Transfer) agar nuansa Fintech-nya langsung terasa. Apakah tampilan ini sudah sesuai dengan bayangan Fintech yang kamu maksud?Apa saja yang saya ubah? Struktur Stack: Saya mengeluarkan Container Kartu Saldo dari ClipPath. Sekarang ClipPath hanya memotong background biru tua saja, sedangkan Kartu Putih berada di layer atasnya (Positioned paling bawah di kode). Gradient Color: Mengganti warna merah polos (Colors.red) menjadi Gradient Biru agar terlihat lebih modern. Shadow & Radius: Menambahkan BoxShadow dan borderRadius pada kartu putih agar terlihat floating (mengambang) dan tidak kaku. Height Management: Saya memberikan height: 320.h pada parent container agar ada ruang bagi kartu putih untuk "keluar" sedikit dari area background biru. Mock Data: Menambahkan layout saldo dan tombol (Top Up, Transfer) agar nuansa Fintech-nya langsung terasa. Apakah tampilan ini sudah sesuai dengan bayangan Fintech yang kamu maksud?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
