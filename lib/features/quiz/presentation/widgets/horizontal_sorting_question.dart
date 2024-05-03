import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';

class HorizontalSortingQuestion extends StatefulWidget {
  const HorizontalSortingQuestion({super.key});

  @override
  State<HorizontalSortingQuestion> createState() => _HorizontalSortingQuestionState();
}

class _HorizontalSortingQuestionState extends State<HorizontalSortingQuestion> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget('Horizontal Sorting Question Is Coming Soon!'),
    );
  }
}
