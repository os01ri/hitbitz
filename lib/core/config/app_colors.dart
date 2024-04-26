import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

abstract class AppColors {
  static const primaryColor = Color(0xff3d8361);

  static const lightSurfaceContainer = Color(0xffFFFFFF);
  static const darkSurfaceContainer = Color(0xff1D2021);

  static Color highlightColorShimmer = const Color(0xffcbcbcb).withOpacity(0.6);

  static Color surfaceContainer(BuildContext context) => context.isDark ? const Color(0xff1D2021) : const Color(0xffECEEEF);

  static Color blue = const Color(0xff4f55ff);
  static Color red = const Color(0xffff0055);
  static Color orange = const Color(0xffff8f1e);
  static Color green = const Color(0xff00e28c);

  static List<Color> answersColors = [blue, red, orange, green];
}
