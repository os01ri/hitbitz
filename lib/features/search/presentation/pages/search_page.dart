import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hitbitz/features/home/domain/usecases/get_roadmaps_usecase.dart';
import 'package:hitbitz/features/home/presentation/cubit/home_cubit.dart';
import 'package:hitbitz/features/home/presentation/widgets/category_card.dart';
import 'package:hitbitz/features/home/presentation/widgets/road_map_card.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_levels_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_steps_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart';
import 'package:hitbitz/features/roadmap/presentation/cubit/roadmap_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final RoadmapCubit _roadmapsCubit;
  late final HomeCubit _categoriesCubit;

  @override
  void initState() {
    super.initState();
    _roadmapsCubit = RoadmapCubit(
      getLevelsUsecase: di<GetLevelsUsecase>(),
      getStepsUsecase: di<GetStepsUsecase>(),
      roadMapToggleBookmarkUsecase: di<RoadMapToggleBookmarkUsecase>(),
      getSavedRoadmapsUsecase: di<GetSavedRoadmapsUsecase>(),
      getRoadMapsUsecase: di<GetRoadMapsUsecase>(),
    )..getRoadMaps(GetRoadMapsParams(name: widget.query));

    _categoriesCubit = di<HomeCubit>()..getCategories(GetCategoriesParams(name: widget.query));

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _roadmapsCubit.close();
    _categoriesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Categories'),
          Tab(text: 'Roadmaps'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocProvider.value(
            value: _categoriesCubit,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return GridView.builder(
                  padding: AppPadding.gridViewPadding,
                  itemCount: state.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context, index) => CategoryCard(category: state.categories[index]),
                );
              },
            ),
          ),
          BlocProvider.value(
            value: _roadmapsCubit,
            child: BlocBuilder<RoadmapCubit, RoadmapState>(
              builder: (context, state) {
                return GridView.builder(
                  padding: AppPadding.gridViewPadding,
                  itemCount: state.roadMaps.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => RoadMapCard(roadMap: state.roadMaps[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
