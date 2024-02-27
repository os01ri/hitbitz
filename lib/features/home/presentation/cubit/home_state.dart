part of 'home_cubit.dart';

class HomeState {
  final CubitStatus categoriesStatus;
  final List<CategoryModel> categories;
  final CubitStatus roadMapsStatus;
  final List<RoadMapModel> roadMaps;
  final Failure? failure;

  const HomeState({
    this.categoriesStatus = CubitStatus.initial,
    this.categories = const [],
    this.roadMapsStatus = CubitStatus.initial,
    this.roadMaps = const [],
    this.failure,
  });

  HomeState copyWith({
    CubitStatus? categoriesStatus,
    List<CategoryModel>? categories,
    CubitStatus? roadMapsStatus,
    List<RoadMapModel>? roadMaps,
    Failure? failure,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      roadMapsStatus: roadMapsStatus ?? this.roadMapsStatus,
      roadMaps: roadMaps ?? this.roadMaps,
      failure: failure ?? this.failure,
    );
  }
}
