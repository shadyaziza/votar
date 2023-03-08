import 'package:design_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_switcher.g.dart';

@riverpod
class ThemeSiwtcherController extends _$ThemeSiwtcherController {
  /// [build] represents the intial state of this, which in this
  /// case will be the device theme mode
  ///
  @override
  AppThemeMode build() {
    switch (WidgetsBinding.instance.platformDispatcher.platformBrightness) {
      case Brightness.dark:
        return AppThemeMode.dark;

      case Brightness.light:
        return AppThemeMode.light;
    }
  }

  void toggle() {
    switch (state) {
      case AppThemeMode.light:
        state = AppThemeMode.dark;
        break;
      case AppThemeMode.dark:
        state = AppThemeMode.light;
        break;
    }
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
