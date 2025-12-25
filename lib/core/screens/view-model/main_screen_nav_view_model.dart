import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class State {
  final PersistentTabController controller;
  final List<ScrollController> scrollController;

  State({required this.controller, required this.scrollController});
}

final mainScreenNavViewModel = Provider<State>((ref) {
  final PersistentTabController controller = PersistentTabController();
  final List<ScrollController> scrollController = [
    ScrollController(),
    ScrollController(),
  ];

  ref.onDispose(() {
    controller.dispose();
    for (var el in scrollController) {
      el.dispose();
    }
  });

  return State(controller: controller, scrollController: scrollController);
});
