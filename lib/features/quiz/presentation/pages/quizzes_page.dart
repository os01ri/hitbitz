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
import 'package:hitbitz/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({super.key});

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  @override
  void initState() {
    super.initState();
    di<QuizCubit>().getQuizzes();
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
            CubitStatus.failure => ErrorButtonWidget(onTap: () => di<QuizCubit>().getQuizzes()).center(),
            CubitStatus.success => ListView.separated(
                itemCount: state.quizzes.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) => CardWidget(
                  // onTap: () => context.pushNamed(AppRoutes.quiz),
                  color: index < 1
                      ? Colors.green
                      : index > 1
                          ? context.colorScheme.primary.withOpacity(.3)
                          : context.colorScheme.primary,
                  child: ListTile(
                    onTap: () => context.pushNamed(AppRoutes.quizIntro, extra: state.quizzes[index].id),
                    leading: CardWidget(
                      isCircle: true,
                      color: context.colorScheme.onPrimary,
                      width: 22,
                      height: 22,
                      borderColor: context.colorScheme.primary,
                      child: Icon(
                        index == 1
                            ? FontAwesomeIcons.play
                            : index > 1
                                ? FontAwesomeIcons.lock
                                : FontAwesomeIcons.check,
                        color: index == 0 ? Colors.green : context.colorScheme.primary,
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
}
