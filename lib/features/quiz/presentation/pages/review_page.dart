import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/presentation/widgets/question_type_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.quiz});

  final QuizModel quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('AppStrings.quizReview'),
      ),
      body: ListView.separated(
        padding: AppPadding.listViewPadding,
        itemCount: quiz.questions.length,
        separatorBuilder: (context, index) => const Gap(8),
        itemBuilder: (context, index) => CardWidget(
          isOutlined: true,
          isShadowed: true,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              QuestionTypeWidget(questionType: quiz.questions[index].type),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextWidget(
                    '${index + 1}. ',
                    maxLines: 20,
                    style: context.textTheme.titleSmall,
                    children: [
                      TextWidget(quiz.questions[index].title),
                    ],
                  ),
                  const Gap(5),
                  TextWidget(
                    quiz.questions[index].showCorrectAnswers(),
                    maxLines: 20,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: quiz.questions[index].isCorrect == true ? context.colorScheme.tertiary : context.colorScheme.error,
                    ),
                  ),
                ],
              ).wrapPadding(AppPadding.innerCardPadding),
            ],
          ),
        ),
      ),
    );
  }
}
