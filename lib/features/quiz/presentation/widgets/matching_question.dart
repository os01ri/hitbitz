import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';

class MatchingQuestion extends StatelessWidget {
  const MatchingQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: TextWidget(AppStrings.matchingComingSoon));
  }
}
