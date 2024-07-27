part of 'cv_bloc.dart';

class CvState {
  final CubitStatus cvStatus;
  final CubitStatus indexRoadmaps;
  final CubitStatus indexCategories;
  final List<RoadMapModel> roadmaps;
  final List<CategoryModel> categories;

  const CvState({
    this.cvStatus = CubitStatus.initial,
    this.indexRoadmaps = CubitStatus.initial,
    this.indexCategories = CubitStatus.initial,
    this.roadmaps = const [],
    this.categories = const [],
  });

  CvState copyWith({
    CubitStatus? cvStatus,
    CubitStatus? indexRoadmaps,
    CubitStatus? indexCategories,
    List<RoadMapModel>? roadmaps,
    List<CategoryModel>? categories,
  }) {
    return CvState(
      cvStatus: cvStatus ?? this.cvStatus,
      indexRoadmaps: indexRoadmaps ?? this.indexRoadmaps,
      indexCategories: indexCategories ?? this.indexCategories,
      roadmaps: roadmaps ?? this.roadmaps,
      categories: categories ?? this.categories,
    );
  }
}
