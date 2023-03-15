import 'package:design_system/src/pkg.dart';
import 'package:flutter/widgets.dart';

class AppFlag {
  static Widget fromString(String countryCode,
      {double? height, double? width}) {
    return Image.asset(
      'assets/flags/${countryCode.toLowerCase()}.png',
      package: pkg,
      height: height,
      width: width,
    );
  }
}
