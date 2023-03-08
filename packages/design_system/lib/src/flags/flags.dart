import 'package:flag/flag.dart';
import 'package:flutter/widgets.dart';

class AppFlag {
  static Widget fromString(String countryCode,
      {double? height, double? width}) {
    return Flag.fromString(
      countryCode,
      height: height,
      width: width,
    );
  }
}
