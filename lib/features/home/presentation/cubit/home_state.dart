part of 'home_cubit.dart';

class HomeState {
  final CubitStatus categoriesStatus;
  final List<CategoryModel> categories;

  final Failure? failure;

  const HomeState({
    this.categoriesStatus = CubitStatus.initial,
    this.categories = const [],
    this.failure,
  });

  HomeState copyWith({
    CubitStatus? categoriesStatus,
    List<CategoryModel>? categories,
    Failure? failure,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      failure: failure ?? this.failure,
    );
  }
}
