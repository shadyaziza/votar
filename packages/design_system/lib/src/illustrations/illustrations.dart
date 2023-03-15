import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../pkg.dart';

enum Illustrations {
  technySolvingMentalHealthProblem,
  technyOpenBoxWithFillerAndQuestionMark,
  technyWaitingDownloadingWithHourglass;
}

extension IllustrationsX on Illustrations {
  String get asset => 'assets/svgs/$name.svg';
}

class AppSvg extends StatelessWidget {
  const AppSvg({super.key, required this.svg, this.height, this.width});
  final Illustrations svg;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg.asset,
      height: height,
      width: width,
      package: pkg,
    );
  }
}
