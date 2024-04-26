import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_assets.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/box_shadow.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/quiz/presentation/cubit/quiz_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class QuizIntroPage extends StatefulWidget {
  const QuizIntroPage({super.key, required this.id});

  final int id;

  @override
  State<QuizIntroPage> createState() => _QuizIntroPageState();
}

class _QuizIntroPageState extends State<QuizIntroPage> {
  @override
  void initState() {
    super.initState();
    di<QuizCubit>().showQuiz(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<QuizCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: context.pop, icon: const Icon(Icons.close)),
          actions: [
            IconButton(onPressed: context.pop, icon: const Icon(Icons.edit)),
            IconButton(onPressed: context.pop, icon: const Icon(Icons.star_rate_rounded)),
            IconButton(onPressed: context.pop, icon: const Icon(Icons.more_horiz)),
          ],
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) => switch (state.showStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure => ErrorButtonWidget(onTap: () => di<QuizCubit>().showQuiz(widget.id)),
            CubitStatus.success => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageWidget(path: AppAssets.onboarding1, width: context.width),
                  const Gap(10),
                  TextWidget(
                    state.quiz!.name,
                    maxLines: 4,
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap(10),
                  const Divider(),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(state.quiz!.questions.length.toString()),
                            const TextWidget('Questions'),
                          ],
                        ),
                        const VerticalDivider(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget('10'),
                            TextWidget('Questions'),
                          ],
                        ),
                        const VerticalDivider(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget('10'),
                            TextWidget('Questions'),
                          ],
                        ),
                        const VerticalDivider(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget('10'),
                            TextWidget('Questions'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Gap(10),
                  ListTile(
                    leading: const CircleAvatar(),
                    title: TextWidget(
                      'Andrew Tiet',
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: TextWidget('@andrew_tiet', style: context.textTheme.bodySmall),
                    trailing: ButtonWidget(
                      onPressed: () {},
                      width: 50,
                      height: 30,
                      text: 'follow',
                      isOutlined: true,
                      borderColor: context.colorScheme.tertiary,
                      backgroundColor: context.colorScheme.surface,
                      foregroundColor: context.colorScheme.tertiary,
                    ),
                  ),
                  const Gap(10),
                  TextWidget('Description', style: context.textTheme.titleMedium),
                  TextWidget('text ' * 50, maxLines: 500),
                ],
              ).wrapPadding(AppPadding.pagePadding).scrollable(),
          },
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
          padding: AppPadding.bottomContainerPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(6),
              BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) => switch (state.showStatus) {
                  CubitStatus.initial => const SizedBox.shrink(),
                  CubitStatus.loading => const SizedBox.shrink(),
                  CubitStatus.failure => const SizedBox.shrink(),
                  CubitStatus.success => Row(
                      children: [
                        ButtonWidget(
                          onPressed: () {},
                          width: context.width,
                          height: 50,
                          text: 'Play With A Friend',
                          isOutlined: true,
                          borderColor: context.colorScheme.secondary,
                          backgroundColor: context.colorScheme.surface,
                          foregroundColor: context.colorScheme.secondary,
                        ).expand(),
                        const Gap(5),
                        ButtonWidget(
                          onPressed: () => context.pushNamed(AppRoutes.quiz, extra: state.quiz),
                          width: context.width,
                          height: 50,
                          text: 'Play Alone',
                          backgroundColor: context.colorScheme.primary,
                          foregroundColor: context.colorScheme.onPrimary,
                        ).expand(),
                      ],
                    ),
                },
              ),
              const Gap(6),
            ],
          ),
        ),
      ),
    );
  }
}
