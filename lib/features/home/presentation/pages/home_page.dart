import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_dimensions.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/services/shared_preferences_service.dart';
import 'package:hitbitz/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hitbitz/features/home/domain/usecases/get_roadmaps_usecase.dart';
import 'package:hitbitz/features/home/presentation/cubit/home_cubit.dart';
import 'package:hitbitz/features/home/presentation/widgets/category_card.dart';
import 'package:hitbitz/features/home/presentation/widgets/recent_road_maps.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';
import 'package:hitbitz/features/roadmap/presentation/widgets/road_map_card.dart';

part '../widgets/home_search_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = di<HomeCubit>()..getCategories(const GetCategoriesParams());
    di<RoadmapCubit>().getRoadMaps(const GetRoadMapsParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _homeCubit,
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            _homeCubit.getCategories(const GetCategoriesParams());
            di<RoadmapCubit>().getRoadMaps(const GetRoadMapsParams());
          },
          child: ListView(
            padding: const EdgeInsets.only(bottom: 40),
            children: [
              const _SearchCard().wrapPadding(AppPadding.pagePaddingHorizontal),
              const Gap(10),
              const _SectionTitle(text: AppStrings.whereYouLeft).wrapPadding(AppPadding.pagePaddingHorizontal),
              const Gap(10),
              const RecentRoadmapCard(
                roadMap: RoadMapModel(
                  name: 'Flutter',
                  description: 'Flutter - Mobile Apps Development',
                  rate: 5,
                ),
              ).wrapPadding(AppPadding.pagePaddingHorizontal),
              const Gap(10),
              const _SectionTitle(text: AppStrings.categories).wrapPadding(AppPadding.pagePaddingHorizontal),
              const Gap(10),
              SizedBox(
                height: 120,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) => switch (state.categoriesStatus) {
                    CubitStatus.initial => const SizedBox.shrink(),
                    CubitStatus.loading => const LoadingWidget().center(),
                    CubitStatus.failure => ErrorButtonWidget(onTap: () => _homeCubit.getCategories(const GetCategoriesParams())),
                    CubitStatus.success => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: AppPadding.pagePaddingHorizontal,
                        itemCount: state.categories.length,
                        separatorBuilder: (_, __) => const Gap(10),
                        itemBuilder: (context, index) => CategoryCard(category: state.categories[index]),
                      ),
                  },
                ),
              ),
              const _SectionTitle(text: AppStrings.roadmaps).wrapPadding(AppPadding.pagePaddingHorizontal),
              const Gap(10),
              BlocProvider.value(
                value: di<RoadmapCubit>(),
                child: SizedBox(
                  height: 250,
                  child: BlocBuilder<RoadmapCubit, RoadmapState>(
                    builder: (context, state) => switch (state.roadMapsStatus) {
                      CubitStatus.initial => const SizedBox.shrink(),
                      CubitStatus.loading => const LoadingWidget().center(),
                      CubitStatus.failure => ErrorButtonWidget(onTap: () => di<RoadmapCubit>().getRoadMaps(const GetRoadMapsParams())),
                      CubitStatus.success => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: AppPadding.pagePaddingHorizontal,
                          itemCount: state.roadMaps.length,
                          separatorBuilder: (_, __) => const Gap(10),
                          itemBuilder: (context, index) => RoadMapCard(roadMap: state.roadMaps[index]),
                        ),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text,
      style: context.textTheme.titleMedium?.copyWith(
        color: context.colorScheme.onSurface,
      ),
    );
  }
}
