import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_colors.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/quiz/data/models/question_model.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';

class SortingQuestion extends StatefulWidget {
  const SortingQuestion({super.key});

  @override
  State<SortingQuestion> createState() => _SortingQuestionState();
}

class _SortingQuestionState extends State<SortingQuestion> {
  late final List<Widget> _items;
  late final QuestionModel question;

  @override
  void didChangeDependencies() {
    question = QuestionProvider.of(context)!.question;
    _items = List.from(question.answers)
        .mapIndexed(
          (index, answer) => Padding(
            key: ValueKey(answer.id),
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
          ),
        )
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
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
    ).expand();
  }
}
