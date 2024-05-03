import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/quiz/data/enums/question_type.dart';
import 'package:hitbitz/features/quiz/data/models/question_model.dart';
import 'package:hitbitz/features/quiz/presentation/widgets/gap_filling_question.dart';
import 'package:hitbitz/features/quiz/presentation/widgets/matching_question.dart';
import 'package:hitbitz/features/quiz/presentation/widgets/multiple_select_question.dart';
import 'package:hitbitz/features/quiz/presentation/widgets/true_false_question.dart';
import 'package:hitbitz/features/quiz/presentation/widgets/vertical_sorting_question.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return QuestionProvider(
      question: question,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Gap(30),
          SizedBox(
            height: context.height * .2,
            child: ShaderMask(
              shaderCallback: (Rect rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                stops: [0.0, 0.1, 0.3, 3.0],
              ).createShader(rect),
              blendMode: BlendMode.dstOut,
              child: ListView(
                children: [
                  TextWidget(
                    '${question.title!}\n',
                    maxLines: 100,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: context.textTheme.titleMedium,
                  ).center(),
                ],
              ),
            ),
          ),
          const Divider(),
          const Gap(30),
          switch (question.type) {
            QuestionType.trueFalse => const TrueFalseQuestion(),
            QuestionType.multipleSelect => const MultipleSelectQuestion(),
            QuestionType.matching => const MatchingQuestion(),
            QuestionType.gapFilling => const GapFillingQuestion(),
            QuestionType.verticalSorting => const VerticalSortingQuestion(),
            QuestionType.horizontalSorting => const VerticalSortingQuestion(),
            _ => const SizedBox.shrink(),
          },
          const Gap(30),
        ],
      ).wrapPadding(AppPadding.pagePadding),
    );
  }
}

class QuestionProvider extends InheritedWidget {
  final QuestionModel question;

  const QuestionProvider({
    super.key,
    required super.child,
    required this.question,
  });

  static QuestionProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<QuestionProvider>();
  }

  @override
  bool updateShouldNotify(covariant QuestionProvider oldWidget) {
    return question != oldWidget.question;
  }
}
