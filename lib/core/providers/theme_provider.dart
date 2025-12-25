import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProviderState extends Equatable {
  final ThemeMode themeMode;
  const ThemeProviderState({required this.themeMode});
  ThemeProviderState copyWith({ThemeMode? themeMode}) {
    return ThemeProviderState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object> get props => [themeMode];
}

class ThemeProvider extends Notifier<ThemeProviderState> {
  @override
  ThemeProviderState build() {
    return ThemeProviderState(themeMode: ThemeMode.system);
  }

  void changeThemeMode(ThemeMode theme) {
    state = state.copyWith(themeMode: theme);
  }
}

final themeProvider = NotifierProvider<ThemeProvider, ThemeProviderState>(() {
  return ThemeProvider();
});
