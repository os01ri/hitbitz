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

class LevelDetailsPage extends StatefulWidget {
  final int levelId;

  const LevelDetailsPage({super.key, required this.levelId});

  @override
  State<LevelDetailsPage> createState() => _LevelDetailsPageState();
}

class _LevelDetailsPageState extends State<LevelDetailsPage> {
  @override
  void initState() {
    super.initState();
    di<RoadmapCubit>().getSteps(GetStepsParams(levelId: widget.levelId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<RoadmapCubit>(),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blueAccent.withOpacity(.2),
          notificationPredicate: (notification) => false,
          title: const TextWidget('Fluter - Level 1'),
        ),
        body: BlocBuilder<RoadmapCubit, RoadmapState>(
          builder: (context, state) => switch (state.stepsStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure =>
              ErrorButtonWidget(onTap: () => di<RoadmapCubit>().getSteps(GetStepsParams(levelId: widget.levelId))).center(),
            CubitStatus.success => ListView.separated(
                itemCount: state.steps.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) => CardWidget(
                  onTap: () => context.pushNamed(AppRoutes.quizzes),
                  color: index == 0 ? context.colorScheme.primary : context.colorScheme.primary.withOpacity(.3),
                  child: ListTile(
                    leading: CardWidget(
                      isCircle: true,
                      color: context.colorScheme.onPrimary,
                      width: 22,
                      height: 22,
                      borderColor: context.colorScheme.primary,
                      child: Icon(
                        index == 0 ? FontAwesomeIcons.play : FontAwesomeIcons.lock,
                        color: context.colorScheme.primary,
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
}
