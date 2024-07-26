import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/features/quiz/data/enums/question_type.dart';

class QuestionTypeWidget extends StatelessWidget {
  const QuestionTypeWidget({
    super.key,
    required this.questionType,
  });

  final QuestionType questionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.def.add(const EdgeInsetsDirectional.only(end: 8)),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(20),
          bottomEnd: Radius.circular(20),
        ),
      ),
      child: TextWidget(
        questionType.name,
        textColor: context.colorScheme.onSecondary,
        textAlign: TextAlign.start,
      ),
    );
  }
}
