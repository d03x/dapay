import 'package:dapay/features/account/persentation/screens/account_screen.dart';
import 'package:dapay/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:dapay/features/auth/presentation/screens/auth_register_screen.dart';
import 'package:dapay/features/home/persentation/screens/home_screen_content.dart';
import 'package:dapay/features/home/persentation/view_model/presisten_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(ColorScheme colors) {
    return [
      // ITEM 1: HOME
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home_rounded,
        ), // Gunakan rounded icon biar lebih modern
        title: ("Home"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: Colors.grey, // Warna abu saat tidak aktif
        activeColorSecondary:
            colors.primary, // Warna icon saat aktif (untuk style tertentu)
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.edit_document),
        title: ("Transaksi"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: colors.primary,
      ),

      // ITEM 3: REGISTER
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: ("Notifikasi"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: colors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Akun"),
        activeColorPrimary: colors.primary,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: colors.primary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final navState = ref.watch(presistentNavigationViewModel);

    return PersistentTabView(
      context,
      controller: navState.controller,
      screens: _buildScreens(),
      items: _navBarsItems(colors),
      backgroundColor: Colors.white, // Background bar putih bersih
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,

      decoration: NavBarDecoration(
        colorBehindNavBar:
            Colors.transparent, // Transparan di belakang lengkungan
        // Memberikan efek bayangan (Shadow) halus
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
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
