import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/domain/usecases/get_quizzes_usecase.dart';
import 'package:hitbitz/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({super.key, required this.stepId});

  final int stepId;

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  @override
  void initState() {
    super.initState();
    di<QuizCubit>().getQuizzes(GetQuizzedParams(stepId: widget.stepId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<QuizCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const TextWidget(AppStrings.quizzes)),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) => switch (state.getStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure =>
              ErrorButtonWidget(onTap: () => di<QuizCubit>().getQuizzes(GetQuizzedParams(stepId: widget.stepId))).center(),
            CubitStatus.success => ListView.separated(
                itemCount: state.quizzes.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) => CardWidget(
                  // onTap: () => context.pushNamed(AppRoutes.quiz),
                  color: getColor(index: index, quizzes: state.quizzes),
                  child: ListTile(
                    onTap: () => context.pushNamed(AppRoutes.quizIntro, extra: state.quizzes[index].id),
                    leading: CardWidget(
                      isCircle: true,
                      color: context.colorScheme.onPrimary,
                      width: 22,
                      height: 22,
                      borderColor: context.colorScheme.primary,
                      child: Icon(
                        getIconData(index: index, quizzes: state.quizzes),
                        color: getColor(index: index, quizzes: state.quizzes),
                        size: 14,
                      ),
                    ),
                    title: TextWidget(
                      state.quizzes[index].name,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
          },
        ).wrapPadding(AppPadding.pagePadding),
      ),
    );
  }

  Color getColor({required int index, required List<QuizModel> quizzes}) {
    return quizzes[index].isCompleted ?? false
        ? Colors.green
        : (index > 0 && (quizzes[index - 1].isCompleted ?? false) || index == 0)
            ? context.colorScheme.primary
            : context.colorScheme.primary.withOpacity(.3);
  }

  IconData getIconData({required int index, required List<QuizModel> quizzes}) {
    return quizzes[index].isCompleted ?? false
        ? FontAwesomeIcons.check
        : (index > 0 && (quizzes[index - 1].isCompleted ?? false) || index == 0)
            ? FontAwesomeIcons.play
            : FontAwesomeIcons.lock;
  }
}
