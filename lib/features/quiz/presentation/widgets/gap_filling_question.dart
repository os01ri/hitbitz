import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_field_widget.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
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
    return Column(
      children: [
        Center(
          child: TextFieldWidget(
            label: 'Fill The Gap',
            controller: _controller,
          ),
        ),
        const Gap(30),
        ButtonWidget(
          text: 'Done!',
          width: context.width * .3,
          isOutlined: true,
          onPressed: () {
            final userAnswer = _controller.text.toLowerCase().trim();
            final isCorrect = question.answers.any((answer) => answer.title!.toLowerCase().trim() == userAnswer);
            Toaster.showIsCorrect(isCorrect);
          },
        ),
        const Gap(5),
      ],
    );
  }
}
