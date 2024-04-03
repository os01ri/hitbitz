import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_levels_usecase.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class RoadmapDetailsPage extends StatefulWidget {
  const RoadmapDetailsPage({super.key, required this.roadMap});

  final RoadMapModel roadMap;

  @override
  State<RoadmapDetailsPage> createState() => _RoadmapDetailsPageState();
}

class _RoadmapDetailsPageState extends State<RoadmapDetailsPage> {
  late final RoadmapCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<RoadmapCubit>()
      ..getLevels(
        GetLevelsParams(roadmapId: widget.roadMap.id!),
      );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withOpacity(.2),
        notificationPredicate: (notification) => false,
        title: const TextWidget('Roadmap Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_add_outlined,
                color: context.colorScheme.onBackground),
          ),
        ],
      ),
      body: BlocProvider.value(
        value: _cubit,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.blueAccent.withOpacity(.2),
              width: context.width,
              height: context.height * .3,
              child: const Icon(
                Icons.flutter_dash_outlined,
                color: Colors.blueAccent,
                size: 150,
              ),
            ).positioned(top: 0),
            Container(
              height: context.height * .65,
              width: context.width,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.mediumBorderRadius),
                  topRight: Radius.circular(AppDimensions.mediumBorderRadius),
                ),
              ),
              padding: AppPadding.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextWidget(
                    widget.roadMap.name, // 'Flutter - Mobile App Development',
                    maxLines: 3,
                    style: context.textTheme.headlineSmall,
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.userGroup, size: 16),
                          Gap(3),
                          TextWidget('1.2 K'),
                        ],
                      ),
                      const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.clock, size: 16),
                          Gap(3),
                          TextWidget('56 h'),
                        ],
                      ),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.star, size: 16),
                          const Gap(3),
                          TextWidget(widget.roadMap.rate.toString()),
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  TextWidget(
                    widget.roadMap.description,
                    //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                    maxLines: 50,
                  ),
                  const Gap(20),
                  TextWidget(
                    'Levels',
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap(10),
                  BlocBuilder<RoadmapCubit, RoadmapState>(
                    builder: (context, state) => switch (state.levelsStatus) {
                      CubitStatus.initial => const SizedBox.shrink(),
                      CubitStatus.loading => const LoadingWidget().center(),
                      CubitStatus.failure => ErrorButtonWidget(
                          onTap: () => _cubit.getLevels(
                                GetLevelsParams(
                                  roadmapId: widget.roadMap.id!,
                                ),
                              )).center(),
                      CubitStatus.success => ListView.separated(
                          itemCount: state.levels.length,
                          separatorBuilder: (context, index) => const Gap(10),
                          itemBuilder: (context, index) => CardWidget(
                            isOutlined: true,
                            child: ExpansionTile(
                              initiallyExpanded: false,
                              childrenPadding: AppPadding.innerCardPadding,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              leading: (index == 0)
                                  ? const FaIcon(FontAwesomeIcons.lockOpen,
                                      color: Colors.green)
                                  : const FaIcon(FontAwesomeIcons.lock,
                                      color: Colors.red),
                              title: TextWidget(state.levels[index].name),
                              subtitle: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.userGroup,
                                          size: 16),
                                      Gap(3),
                                      TextWidget('1.2 K'),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.clock, size: 16),
                                      Gap(3),
                                      TextWidget('56 h'),
                                    ],
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                              children: [
                                const TextWidget(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                                  maxLines: 50,
                                ),
                                const Gap(10),
                                TextWidget(
                                  'Requirements',
                                  style: context.textTheme.titleMedium,
                                ),
                                const Gap(10),
                                for (int i = 0; i < 3; i++)
                                  const ListTile(
                                    title: TextWidget(
                                      'Knowledge of programming fundamentals',
                                      maxLines: 10,
                                    ),
                                    trailing:
                                        Icon(Icons.check, color: Colors.green),
                                  ),
                                const Gap(10),
                                ButtonWidget(
                                  onPressed: () => context.pushNamed(
                                      AppRoutes.levelDetails,
                                      extra: state.levels[index].id),
                                  width: context.width,
                                  backgroundColor: context.colorScheme.primary,
                                  foregroundColor:
                                      context.colorScheme.onPrimary,
                                  text: 'Start',
                                ),
                              ],
                            ),
                          ),
                        ).expand(),
                    },
                  ),
                ],
              ),
            ).positioned(bottom: 0),
          ],
        ),
      ),
    );
  }
}
