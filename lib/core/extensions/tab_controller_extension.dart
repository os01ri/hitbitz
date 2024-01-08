import 'package:flutter/material.dart';
import 'package:hitbitz/core/config/app_constants.dart';

extension TabControllerExtension on TabController {
  goTo(int index) {
    animateTo(
      index,
      duration: AppConstants.animationDurationX3,
      curve: Curves.linear,
    );
  }
}

extension PageControllerExtension on PageController {
  goTo(int index) {
    animateToPage(
      index,
      duration: AppConstants.animationDurationX2,
      curve: Curves.linear,
    );
  }
}
