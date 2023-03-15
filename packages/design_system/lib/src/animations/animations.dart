import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../pkg.dart';

enum AnimJson {
  technyBusinessAnalyticsOnTabletScreen,
  technyFoodOrderComplete,
  technyPieChartWithWhitePart;
}

extension AnimJsonX on AnimJson {
  String get asset => 'assets/anim/$name.json';
}

class AppLottie extends StatelessWidget {
  const AppLottie({super.key, required this.animJson, this.height, this.width});
  final AnimJson animJson;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      animJson.asset,
      height: height,
      width: width,
      package: pkg,
    );
  }
}
