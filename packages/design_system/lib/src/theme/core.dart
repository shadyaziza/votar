library core_theme;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static String get fontFamily => 'BalooBhaijaan2';
  static ThemeData get lightTheme => FlexThemeData.light(
        fontFamily: fontFamily,
        scheme: FlexScheme.damask,
        scaffoldBackground: const Color(
          0xffE8D5B5,
        ),
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.damask,
        fontFamily: fontFamily,
      );
}
