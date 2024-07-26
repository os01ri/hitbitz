import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../text_theme.dart';
import 'light_scheme.dart';

ThemeData get lightTheme {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    colorScheme: lightColorScheme,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: lightColorScheme.surface,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightSurfaceContainer,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(lightColorScheme.onTertiary),
      shape: const CircleBorder(),
      side: const BorderSide(width: .5),
    ),
    cardColor: AppColors.lightSurfaceContainer,
  );
}
