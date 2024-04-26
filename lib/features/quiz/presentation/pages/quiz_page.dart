import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/box_shadow.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/tab_controller_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/presentation/pages/question_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.quiz});

  final QuizModel quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final PageController _pageController;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 1;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(widget.quiz.name),
        leading: TextWidget('$index / ${widget.quiz.questions.length}').center(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))],
        bottom: ProgressBar(value: index / widget.quiz.questions.length),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.quiz.questions.length,
        padEnds: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => QuestionPage(question: widget.quiz.questions[index]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [customBoxShadow],
        ),
        padding: AppPadding.pagePadding,
        child: Builder(
          builder: (context) => Row(
            children: [
              ButtonWidget(
                onPressed: () {
                  if (index <= 1) {
                    context.pop();
                    return;
                  }

                  index--;
                  setState(() => _pageController.goToPreviousPage());
                },
                isOutlined: true,
                borderColor: context.colorScheme.error,
                backgroundColor: context.colorScheme.surface,
                foregroundColor: context.colorScheme.error,
                height: 50,
                text: 'Back',
              ).expand(),
              const Gap(AppDimensions.smallSizedBox),
              ButtonWidget(
                onPressed: () {
                  if (index >= widget.quiz.questions.length) {
                    context.pop();
                    return;
                  }

                  index++;
                  setState(() => _pageController.goToNextPage());
                },
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.onPrimary,
                height: 50,
                text: 'Next',
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatefulWidget implements PreferredSizeWidget {
  const ProgressBar({super.key, required this.value});

  final double value;

  @override
  State<ProgressBar> createState() => _ProgressBarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 20);
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.value,
      minHeight: 15,
      borderRadius: BorderRadius.circular(10),
      color: context.colorScheme.primary,
    ).paddingHorizontal(30);
  }
}
