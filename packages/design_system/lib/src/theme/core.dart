library core_theme;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class AppTheme {
  AppTheme._();

  static String get fontFamily => 'BalooBhaijaan2';
  static TextTheme get inputTextThemeDark => TextTheme(
        titleMedium: TextStyle(
          color: Colors.orangeAccent,
          height: 1.8,
        ),
      );
  static TextTheme get inputTextThemeLight => TextTheme(
        titleMedium: TextStyle(
          color: Colors.orangeAccent,
        ),
      );
  static InputDecorationTheme get inputDecoration => InputDecorationTheme(
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pinkAccent),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 217, 0, 72),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 132, 197),
          ),
        ),
      );
  static ThemeData get lightTheme => FlexThemeData.light(
        fontFamily: fontFamily,
        // scheme: FlexScheme.deepPurple,
        // scheme: FlexScheme.damask,

        scheme: FlexScheme.bahamaBlue,
        scaffoldBackground: Colors.grey.shade100,
      ).copyWith(
        inputDecorationTheme: AppTheme.inputDecoration,
        textTheme: inputTextThemeDark,
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        fontFamily: fontFamily,
        // scheme: FlexScheme.damask,
        // scheme: FlexScheme.deepPurple,
        scaffoldBackground: Colors.grey.shade900,
        scheme: FlexScheme.bahamaBlue,
      ).copyWith(
        inputDecorationTheme: AppTheme.inputDecoration,
        textTheme: inputTextThemeDark,
      );
}

enum AppThemeMode {
  light(icon: WeatherIcons.wi_day_sunny, mode: ThemeMode.light),
  dark(icon: WeatherIcons.wi_moon_alt_waxing_crescent_3, mode: ThemeMode.dark);

  const AppThemeMode({required this.icon, required this.mode});
  final IconData icon;
  final ThemeMode mode;
}
