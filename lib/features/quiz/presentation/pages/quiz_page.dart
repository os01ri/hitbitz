import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Quiz'),
      ),
    );
  }
}
