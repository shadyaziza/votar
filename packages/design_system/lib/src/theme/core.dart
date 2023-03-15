library core_theme;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class AppTheme {
  AppTheme._();

  static String get fontFamily => 'BalooBhaijaan2';
  static ThemeData get lightTheme => FlexThemeData.light(
        fontFamily: fontFamily,
        // scheme: FlexScheme.deepPurple,
        // scheme: FlexScheme.damask,
        scheme: FlexScheme.bahamaBlue,
        scaffoldBackground: Colors.grey.shade100,
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        fontFamily: fontFamily,
        // scheme: FlexScheme.damask,
        // scheme: FlexScheme.deepPurple,
        scaffoldBackground: Colors.grey.shade900,
        scheme: FlexScheme.bahamaBlue,
      );
}

enum AppThemeMode {
  light(icon: WeatherIcons.wi_day_sunny, mode: ThemeMode.light),
  dark(icon: WeatherIcons.wi_moon_alt_waxing_crescent_3, mode: ThemeMode.dark);

  const AppThemeMode({required this.icon, required this.mode});
  final IconData icon;
  final ThemeMode mode;
}
