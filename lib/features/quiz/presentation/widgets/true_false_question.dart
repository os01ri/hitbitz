import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_colors.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';

class TrueFalseQuestion extends StatefulWidget {
  const TrueFalseQuestion({super.key});

  @override
  State<TrueFalseQuestion> createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueFalseQuestion> {
  late final ValueNotifier<bool?> _selectedAnswer;

  @override
  void initState() {
    _selectedAnswer = ValueNotifier(null);
    super.initState();
  }

  @override
  void dispose() {
    _selectedAnswer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedAnswer,
      builder: (context, isSelected, _) => Row(
        children: [
          CardWidget(
            isShadowed: isSelected != true,
            isOutlined: isSelected == true,
            borderColor: context.colorScheme.onSurface,
            onTap: () => _selectAnswer(context: context, answer: true),
            height: context.height * .3,
            color: AppColors.green,
            child: TextWidget(
              AppStrings.trueWord,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ).expand(),
          const Gap(24),
          CardWidget(
            isShadowed: isSelected != false,
            isOutlined: isSelected == false,
            borderColor: context.colorScheme.onSurface,
            onTap: () => _selectAnswer(context: context, answer: false),
            height: context.height * .3,
            color: AppColors.red,
            child: TextWidget(
              AppStrings.falseWord,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ).expand(),
        ],
      ),
    );
  }

  _selectAnswer({required BuildContext context, required bool answer}) {
    log(answer.toString());
    final question = QuestionProvider.of(context)!.question;

    _selectedAnswer.value = answer;
    final isCorrect = question.correctAnswers.first == (answer ? 1 : 0);
    question.isCorrect = isCorrect;
  }
}
