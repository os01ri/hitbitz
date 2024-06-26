import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quiz_page.dart';

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
    return Column(
      children: [
        Center(
          child: TextFieldWidget(
            label: AppStrings.fillTheGap,
            controller: _controller,
          ),
        ),
        const Gap(30),
        ButtonWidget(
          text: AppStrings.done,
          width: context.width * .3,
          isOutlined: true,
          onPressed: () {
            if (question.isCorrect != null) return;
            final userAnswer = _controller.text.toLowerCase().trim();
            final isCorrect = question.answers.any((answer) => answer.title!.toLowerCase().trim() == userAnswer);
            question.isCorrect = isCorrect;
            Toaster.showIsCorrect(isCorrect);
            if (isCorrect) QuizProvider.of(context)!.score.value++;
          },
        ),
        const Gap(5),
      ],
    );
  }
}
