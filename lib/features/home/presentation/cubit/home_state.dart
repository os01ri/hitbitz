part of 'home_cubit.dart';

class HomeState {
  final CubitStatus categoriesStatus;
  final List<CategoryModel> categories;
  final CubitStatus homeRoadMapStatus;
  final RoadMapModel? roadMap;

  final Failure? failure;

  const HomeState({
    this.categoriesStatus = CubitStatus.initial,
    this.categories = const [],
    this.homeRoadMapStatus = CubitStatus.initial,
    this.roadMap,
    this.failure,
  });

  HomeState copyWith({
    CubitStatus? categoriesStatus,
    List<CategoryModel>? categories,
    CubitStatus? homeRoadMapStatus,
    RoadMapModel? roadMap,
    Failure? failure,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      homeRoadMapStatus: homeRoadMapStatus ?? this.homeRoadMapStatus,
      roadMap: roadMap ?? this.roadMap,
      failure: failure ?? this.failure,
    );
  }
}
