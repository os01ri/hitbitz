import 'package:flutter/material.dart';
import 'package:hitbitz/router/app_pages.dart';

extension Gradients on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;

  LinearGradient get primaryLinear => LinearGradient(
        colors: [Theme.of(this).primaryColor, Theme.of(this).primaryColor.withOpacity(.5)],
      );

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  void popDialog<T extends Object?>([T? result]) => Navigator.of(this).pop<T>(result);

  void popUntil(String routeName) => AppPages.rootNavigatorKey.currentState?.popUntil(
        (route) => route.settings.name == routeName,
      );
}
