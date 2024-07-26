import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';

class GapFillingQuestion extends StatefulWidget {
  const GapFillingQuestion({super.key});

  @override
  State<GapFillingQuestion> createState() => _GapFillingQuestionState();
}

class _GapFillingQuestionState extends State<GapFillingQuestion> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = QuestionProvider.of(context)!.question;
    return Center(
      child: TextFieldWidget(
        label: AppStrings.fillTheGap,
        controller: _controller,
        onChanged: (value) {
          final userAnswer = value.toLowerCase().trim();
          final isCorrect = question.answers.any((answer) => answer.title!.toLowerCase().trim() == userAnswer);
          question.isCorrect = isCorrect;
        },
      ),
    );
  }
}
