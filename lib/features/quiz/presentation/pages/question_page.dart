import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/quiz/data/enums/question_type.dart';
import 'package:hitbitz/features/quiz/data/models/question_model.dart';

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

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.question});

  final QuestionModel question;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return QuestionProvider(
      question: widget.question,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
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
                    '${widget.question.title!}\n',
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
          const Spacer(),
          switch (widget.question.type) {
            QuestionType.trueFalse => const TrueFalseQuestion(),
            QuestionType.multiSelect => const MultiSelectQuestion(),
            QuestionType.match => const MatchQuestion(),
            QuestionType.fillGap => const FillGapQuestion(),
            QuestionType.sort => const SortQuestion(),
            _ => const SizedBox.shrink(),
          },
          const Spacer(),
        ],
      ).wrapPadding(AppPadding.pagePadding),
    );
  }
}

class TrueFalseQuestion extends StatelessWidget {
  const TrueFalseQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardWidget(
          onTap: () {
            if (QuestionProvider.of(context)!.question.correctAnswer!.single == 1) {
              Toaster.showSuccess(context: context, message: 'Correct!');
            } else {
              Toaster.showError(context: context, message: '');
            }
          },
          height: context.height * .3,
          color: const Color(0xff00e28c),
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
            if (QuestionProvider.of(context)!.question.correctAnswer!.single == 0) {
              Toaster.showSuccess(context: context, message: 'Correct!');
            } else {
              Toaster.showError(context: context, message: '');
            }
          },
          height: context.height * .3,
          color: const Color(0xffff0055),
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

class MultiSelectQuestion extends StatelessWidget {
  const MultiSelectQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MatchQuestion extends StatelessWidget {
  const MatchQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FillGapQuestion extends StatelessWidget {
  const FillGapQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SortQuestion extends StatelessWidget {
  const SortQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
