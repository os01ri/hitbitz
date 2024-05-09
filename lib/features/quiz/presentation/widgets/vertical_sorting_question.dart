import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_colors.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/quiz/data/models/answer_model.dart';
import 'package:hitbitz/features/quiz/data/models/question_model.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quiz_page.dart';

class VerticalSortingQuestion extends StatefulWidget {
  const VerticalSortingQuestion({super.key});

  @override
  State<VerticalSortingQuestion> createState() => _VerticalSortingQuestionState();
}

class _VerticalSortingQuestionState extends State<VerticalSortingQuestion> {
  late final List<_Tile> _items;
  late final QuestionModel question;

  @override
  void didChangeDependencies() {
    question = QuestionProvider.of(context)!.question;
    _items = List.from(question.answers)
        .mapIndexed(
          (index, answer) => _Tile(
            key: ValueKey(answer.id),
            answer: answer,
            index: index,
          ),
        )
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          children: _items,
        ).expand(),
        const Gap(30),
        ButtonWidget(
          text: 'Done!',
          width: context.width * .3,
          isOutlined: true,
          onPressed: () {
            if (question.isCorrect != null) return;

            bool isCorrect = true;
            for (int i = 0; i < _items.length; i++) {
              final isCorrectOrder = _items[i].answer.order == i + 1;
              isCorrect &= isCorrectOrder;
            }

            question.isCorrect = isCorrect;
            Toaster.showIsCorrect(isCorrect);
            if (isCorrect) QuizProvider.of(context)!.score.value++;
          },
        ),
        const Gap(5),
      ],
    ).expand();
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    super.key,
    required this.answer,
    required this.index,
  });

  final AnswerModel answer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: TextWidget(
          answer.title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
        ),
        tileColor: AppColors.answersColors[index % 4],
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
