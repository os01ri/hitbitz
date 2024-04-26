import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_colors.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';

class TrueFalseQuestion extends StatelessWidget {
  const TrueFalseQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final question = QuestionProvider.of(context)!.question;
    return Row(
      children: [
        CardWidget(
          onTap: () {
            if (question.correctAnswers.single == 1) {
              Toaster.showSuccess(context: context, message: 'Correct!');
            } else {
              Toaster.showError(context: context, message: '');
            }
          },
          height: context.height * .3,
          color: AppColors.green,
          child: TextWidget(
            'True',
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ).expand(),
        const Gap(24),
        CardWidget(
          onTap: () {
            if (question.correctAnswers.single == 0) {
              Toaster.showSuccess(context: context, message: 'Correct!');
            } else {
              Toaster.showError(context: context, message: '');
            }
          },
          height: context.height * .3,
          color: AppColors.red,
          child: TextWidget(
            'False',
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ).expand(),
      ],
    );
  }
}
