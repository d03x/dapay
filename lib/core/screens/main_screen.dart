import 'package:dapay/core/extensions/extension.dart';
import 'package:dapay/core/screens/view-model/main_screen_nav_view_model.dart';
import 'package:dapay/features/account/persentation/screens/account_screen.dart';
import 'package:dapay/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:dapay/features/auth/presentation/screens/auth_register_screen.dart';
import 'package:dapay/features/home/persentation/screens/home_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// 2. Widget Utama (Shell Navigasi)
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  List<Widget> _buildScreens() {
    return [
      HomeScreenContent(),
      const AuthLoginScreen(),
      const AuthRegisterScreen(),
      const AccountScreen(),
      const AccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(ColorScheme colors) {
    return [
      PersistentBottomNavBarItem(
        iconSize: 25.w,
        icon: Icon(LucideIcons.house).animate().scale(
          duration: 300.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        ), // Gunakan rounded icon biar lebih modern

        title: ("Home"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onPrimaryContainer.withValues(
          alpha: 0.5,
        ), // Warna abu saat tidak aktif
        activeColorSecondary:
            colors.primary, // Warna icon saat aktif (untuk style tertentu)
      ),

      PersistentBottomNavBarItem(
        iconSize: 25.w,
        icon: const Icon(LucideIcons.receipt),
        title: ("Transaksi"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onPrimaryContainer.withValues(alpha: 0.5),
        activeColorSecondary: colors.primary,
      ),

      // ITEM 3: REGISTER
      PersistentBottomNavBarItem(
        iconSize: 25.w,
        icon: const Icon(LucideIcons.bell),
        title: ("Notifikasi"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onPrimaryContainer.withValues(alpha: 0.5),
        activeColorSecondary: colors.primary,
      ),
      PersistentBottomNavBarItem(
        iconSize: 25.w,
        icon: const Icon(LucideIcons.message_circle),
        title: ("Chat"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onPrimaryContainer.withValues(alpha: 0.5),
        activeColorSecondary: colors.primary,
      ),

      PersistentBottomNavBarItem(
        iconSize: 25.w,
        icon: const Icon(LucideIcons.user),
        title: ("Akun"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: colors.onPrimaryContainer.withValues(alpha: 0.5),
        activeColorSecondary: colors.primary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = ref.watch(mainScreenNavViewModel);
    return PersistentTabView(
      context,
      controller: navState.controller,
      screens: _buildScreens(),
      items: _navBarsItems(context.colors),
      backgroundColor: context.colors.surface, // Background bar putih bersih
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,

      decoration: NavBarDecoration(
        colorBehindNavBar:
            Colors.transparent, // Transparan di belakang lengkungan
        // Memberikan efek bayangan (Shadow) halus
        boxShadow: [
          BoxShadow(
            color: context.colors.scrim.withValues(alpha: 0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      navBarStyle: NavBarStyle.style3,
    );
  }
}
