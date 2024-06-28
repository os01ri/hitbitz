import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/cached_network_image.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/num_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/show_roadmap_usecase.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/steps_page.dart';
import 'package:hitbitz/router/app_routes.dart';

class RoadMapPageArguments {
  final RoadMapModel roadMap;
  final bool isStarting;

  const RoadMapPageArguments({
    required this.roadMap,
    required this.isStarting,
  });
}

class RoadmapPage extends StatefulWidget {
  const RoadmapPage({super.key, required this.args});

  final RoadMapPageArguments args;

  @override
  State<RoadmapPage> createState() => _RoadmapPageState();
}

class _RoadmapPageState extends State<RoadmapPage> {
  late final RoadmapCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<RoadmapCubit>();
    if (widget.args.isStarting) {
      _cubit.startRoadMap(ShowRoadMapParams(roadmapId: widget.args.roadMap.id!));
    } else {
      _cubit.showRoadMap(ShowRoadMapParams(roadmapId: widget.args.roadMap.id!));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<RoadmapCubit, RoadmapState>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent.withOpacity(.2),
            notificationPredicate: (notification) => false,
            title: const TextWidget(AppStrings.roadmapDetails),
            actions: [
              IconButton(
                onPressed: () => _cubit.roadMapToggleBookmark(RoadMapToggleBookmarkParams(roadmapId: widget.args.roadMap.id!)),
                icon: Icon(
                  Icons.bookmark_add_outlined,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: context.width,
                height: context.height * .3,
                child: (widget.args.roadMap.media?.mediaUrl != null)
                    ? NetworkImageWidget(
                        url: widget.args.roadMap.media!.mediaUrl!,
                        hash: widget.args.roadMap.media!.hash,
                        width: context.width,
                        height: context.height * .3,
                        borderRadius: BorderRadius.zero,
                      )
                    : const SizedBox.shrink(),
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
                child: BlocBuilder<RoadmapCubit, RoadmapState>(
                  builder: (context, state) => switch (state.roadmapStatus) {
                    CubitStatus.initial => const SizedBox.shrink(),
                    CubitStatus.loading => const LoadingWidget().center(),
                    CubitStatus.failure =>
                      ErrorButtonWidget(onTap: () => _cubit.showRoadMap(ShowRoadMapParams(roadmapId: widget.args.roadMap.id!))).center(),
                    CubitStatus.success => CustomScrollView(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        slivers: [
                          SliverToBoxAdapter(
                            child: TextWidget(
                              state.roadmap!.name, // 'Flutter - Mobile App Development',
                              maxLines: 3,
                              style: context.textTheme.headlineSmall,
                            ),
                          ),
                          const SliverToBoxAdapter(child: Gap(10)),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.userGroup, size: 16),
                                    const Gap(3),
                                    TextWidget(state.roadmap!.users.numberFormat()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.clock, size: 16),
                                    const Gap(3),
                                    TextWidget('${state.roadmap!.duration} h'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const FaIcon(FontAwesomeIcons.star, size: 16),
                                    const Gap(3),
                                    TextWidget(state.roadmap!.rate.numberFormat()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SliverToBoxAdapter(child: Gap(10)),
                          SliverToBoxAdapter(
                            child: TextWidget(
                              state.roadmap!.description,
                              //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                              maxLines: 50,
                            ),
                          ),
                          const SliverToBoxAdapter(child: Gap(20)),
                          SliverToBoxAdapter(
                            child: TextWidget(
                              AppStrings.levels,
                              style: context.textTheme.titleLarge,
                            ),
                          ),
                          const SliverToBoxAdapter(child: Gap(10)),
                          SliverList.separated(
                            itemCount: state.roadmap!.levels.length,
                            separatorBuilder: (context, index) => const Gap(10),
                            itemBuilder: (context, index) => CardWidget(
                              isOutlined: true,
                              child: ExpansionTile(
                                initiallyExpanded: false,
                                childrenPadding: AppPadding.innerCardPadding,
                                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                leading: index <= ((state.roadmap!.currentLevel ?? 1) - 1)
                                    ? const FaIcon(FontAwesomeIcons.lockOpen, color: Colors.green)
                                    : const FaIcon(FontAwesomeIcons.lock, color: Colors.red),
                                title: TextWidget(state.roadmap!.levels[index].name),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const FaIcon(FontAwesomeIcons.clock, size: 16),
                                        const Gap(3),
                                        TextWidget('${state.roadmap!.levels[index].id} h'),
                                      ],
                                    ),
                                    const Spacer(flex: 2),
                                  ],
                                ),
                                children: [
                                  TextWidget(
                                    state.roadmap!.levels[index].description,
                                    maxLines: 50,
                                  ),
                                  const Gap(10),
                                  TextWidget(
                                    AppStrings.requirements,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  const Gap(10),
                                  for (int i = 0; i < state.roadmap!.levels[index].requirements.length; i++)
                                    TextWidget(
                                      '#${i + 1} - ${state.roadmap!.levels[index].requirements[i]}',
                                      maxLines: 10,
                                    ).wrapPadding(const EdgeInsets.all(3)),
                                  if (state.roadmap!.currentStep != null && index <= state.roadmap!.currentLevel! - 1) ...[
                                    const Gap(10),
                                    ButtonWidget(
                                      onPressed: () => context.pushNamed(
                                        AppRoutes.steps,
                                        extra: StepsPageArguments(
                                          levelId: state.roadmap!.levels[index].id,
                                          currentStep: state.roadmap!.currentStep! - 1,
                                          hasPassedLevel: index < state.roadmap!.currentLevel! - 1,
                                        ),
                                      ),
                                      width: context.width,
                                      backgroundColor: context.colorScheme.primary,
                                      foregroundColor: context.colorScheme.onPrimary,
                                      text: AppStrings.start,
                                    ),
                                  ],
                                  SizedBox(width: context.width),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  },
                ),
              ).positioned(bottom: 0),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, RoadmapState state) {
    if (state.saveStatus == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.saveStatus == CubitStatus.failure) {
      Toaster.closeLoading();
      Toaster.showError(context: context, message: 'error');
    } else if (state.saveStatus == CubitStatus.success) {
      Toaster.closeLoading();
      Toaster.showSuccess(context: context, message: 'success');
    }
  }
}
