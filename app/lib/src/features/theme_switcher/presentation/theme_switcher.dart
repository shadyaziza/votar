import 'package:caching/utility.dart';
import 'package:design_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_switcher.g.dart';

@riverpod
class ThemeSiwtcherController extends _$ThemeSiwtcherController {
  /// [build] represents the intial state of this, which checks if the user
  /// has saved their pref theme mode, if there is nothing is saved then
  /// it defaults to system mode
  ///
  @override
  AppThemeMode build() {
    final isDarkModeEnabled = ref.watch(utilityCachePod).isDarkModeEnabled;
    if (isDarkModeEnabled) {
      return AppThemeMode.dark;
    } else {
      switch (WidgetsBinding.instance.platformDispatcher.platformBrightness) {
        case Brightness.dark:
          return AppThemeMode.dark;

        case Brightness.light:
          return AppThemeMode.light;
      }
    }
  }

  /// Siwtches the seem in memeory and also calls [_cache] which will
  /// save user's [ThemeMode] pref to app storge
  ///
  void toggle() {
    switch (state) {
      case AppThemeMode.light:
        state = AppThemeMode.dark;

        break;
      case AppThemeMode.dark:
        state = AppThemeMode.light;
        break;
    }
    _cache();
  }

  _cache() {
    ref
        .read(utilityCachePod)
        .cacheThemeMode(isdark: state.mode == ThemeMode.dark);
  }
}

class ThemeSwitcher extends HookConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mode = ref.watch(themeSiwtcherControllerPod);
    return IconButton(
      icon: Icon(mode.icon),
      onPressed: ref.read(themeSiwtcherControllerPod.notifier).toggle,
    );
  }
}
