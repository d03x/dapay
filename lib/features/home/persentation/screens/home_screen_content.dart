import 'package:dapay/core/extensions/extension.dart';
import 'package:dapay/core/widgets/ui/product_menu_item.dart';
import 'package:dapay/features/home/persentation/widget/top_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenContent extends ConsumerWidget {
  HomeScreenContent({super.key});
  final List<ProductMenuItemModel> menus = [
    ProductMenuItemModel(
      title: "Pulsa",
      onTap: (String index) {},
      color: Colors.deepOrange,
      iconPath: "assets/icons/pulsa.svg",
    ),
    ProductMenuItemModel(
      title: "Kuota",
      color: Colors.cyan,
      onTap: (String index) {},
      iconPath: "assets/icons/kuota.svg",
    ),

    ProductMenuItemModel(
      title: "PLN",
      onTap: (String index) {},
      iconPath: "assets/icons/pln.svg",
      color: Colors.yellow[700],
    ),
    ProductMenuItemModel(
      title: "E-Wallet",
      onTap: (String index) {},
      color: Colors.indigo,
      iconPath: "assets/icons/e-wallet.svg",
    ),
    ProductMenuItemModel(
      color: Colors.deepPurple,
      title: "Game Voucher",
      onTap: (String index) {},
      iconPath: "assets/icons/game.svg",
    ),
    ProductMenuItemModel(
      title: "Aktivasi Voucher",
      onTap: (String index) {},
      color: Colors.red,
      iconPath: "assets/icons/aktivasi_voucher.svg",
    ),
    ProductMenuItemModel(
      title: "Telepon & SMS",
      color: Colors.green,
      onTap: (String index) {},
      iconPath: "assets/icons/sms_telepon.svg",
    ),
    ProductMenuItemModel(
      title: "Lainnya",
      onTap: (String index) {},
      iconPath: "assets/icons/menu_plus.svg",
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: context.colors.surface,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    final primaryColor = context.colors.primary;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Container(
                color: context.colors.surface,
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    TopMainScreen(),
                    SizedBox(height: 28.h),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: NotifiedBanner(),
                    // ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: .symmetric(horizontal: 10.w),
                      child: RichText(
                        text: TextSpan(
                          text: "Produk Utama",
                          style: context.textTheme.titleSmall!.copyWith(
                            fontWeight: .w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Agar scroll mengikuti parent
                      shrinkWrap: true,
                      itemCount: menus.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                4, // 4 Kolom (standar aplikasi PPOB)
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 8,
                            childAspectRatio:
                                0.85, // Mengatur rasio tinggi/lebar item
                          ),
                      itemBuilder: (context, index) {
                        return ProductMenuItem(item: menus[index]);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 100.sw,
                color: context.colors.surface,
                child: Text("VOUCHER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
