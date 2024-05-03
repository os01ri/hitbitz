import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_colors.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';

class MultipleSelectQuestion extends StatelessWidget {
  const MultipleSelectQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final question = QuestionProvider.of(context)!.question;

    return Column(
      children: [
        ListView.separated(
          itemCount: question.answers.length,
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) => StatefulBuilder(
            builder: (context, setState) => CheckboxListTile(
              value: question.userAnswersIds.contains(question.answers[index].id),
              fillColor: const MaterialStatePropertyAll(Colors.transparent),
              checkboxShape: const CircleBorder(
                eccentricity: 0,
                side: BorderSide(color: Colors.red, width: 0),
              ),
              onChanged: (_) => setState(
                () {
                  if (question.userAnswersIds.contains(question.answers[index].id)) {
                    question.userAnswersIds.remove(question.answers[index].id);
                  } else {
                    question.userAnswersIds.add(question.answers[index].id);
                  }
                },
              ),
              title: TextWidget(
                question.answers[index].title,
                maxLines: 4,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              tileColor: AppColors.answersColors[index % 4],
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
            ),
          ),
        ).expand(),
        const Gap(5),
        ButtonWidget(
          text: 'Done!',
          width: context.width * .3,
          isOutlined: true,
          onPressed: () {
            if (question.userAnswersIds.isEmpty) return;

            bool isCorrect = true;
            for (var id in question.userAnswersIds) {
              final answer = question.answers.firstWhere((answer) => answer.id == id);
              isCorrect &= answer.isCorrect;
            }

            Toaster.showIsCorrect(isCorrect);
          },
        ),
        const Gap(5),
      ],
    ).expand();
  }
}
