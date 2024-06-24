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
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_steps_usecase.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class StepsPageArguments {
  final int levelId;
  final int currentStep;
  final bool hasPassedLevel;

  const StepsPageArguments({
    required this.levelId,
    required this.currentStep,
    required this.hasPassedLevel,
  });
}

class StepsPage extends StatefulWidget {
  final StepsPageArguments args;

  const StepsPage({super.key, required this.args});

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  @override
  void initState() {
    super.initState();
    di<RoadmapCubit>().getSteps(GetStepsParams(levelId: widget.args.levelId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<RoadmapCubit>(),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blueAccent.withOpacity(.2),
          notificationPredicate: (notification) => false,
          title: const TextWidget('Steps'),
        ),
        body: BlocBuilder<RoadmapCubit, RoadmapState>(
          builder: (context, state) => switch (state.stepsStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure =>
              ErrorButtonWidget(onTap: () => di<RoadmapCubit>().getSteps(GetStepsParams(levelId: widget.args.levelId))).center(),
            CubitStatus.success => ListView.separated(
                itemCount: state.steps.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) => CardWidget(
                  onTap: () {
                    if (!canOpen(index: index)) return;
                    context.pushNamed(AppRoutes.quizzes, extra: state.steps[index].id);
                  },
                  color: getColor(index: index),
                  child: ListTile(
                    leading: CardWidget(
                      isCircle: true,
                      color: context.colorScheme.onPrimary,
                      width: 22,
                      height: 22,
                      borderColor: context.colorScheme.primary,
                      child: Icon(
                        getIconData(index: index),
                        color: getColor(index: index),
                        size: 14,
                      ),
                    ),
                    title: TextWidget(
                      state.steps[index].name,
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

  Color getColor({required int index}) {
    if (widget.args.hasPassedLevel) return Colors.green;
    return index == widget.args.currentStep
        ? context.colorScheme.primary
        : index < widget.args.currentStep
            ? Colors.green
            : context.colorScheme.primary.withOpacity(.3);
  }

  IconData getIconData({required int index}) {
    if (widget.args.hasPassedLevel) return FontAwesomeIcons.check;
    return index == widget.args.currentStep
        ? FontAwesomeIcons.play
        : index < widget.args.currentStep
            ? FontAwesomeIcons.check
            : FontAwesomeIcons.lock;
  }

  bool canOpen({required int index}) => (widget.args.hasPassedLevel || index <= widget.args.currentStep);
}
