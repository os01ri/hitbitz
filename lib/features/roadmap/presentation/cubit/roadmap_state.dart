part of 'roadmap_cubit.dart';

class RoadmapState {
  final CubitStatus levelsStatus;
  final List<LevelModel> levels;
  final Failure? failure;

  const RoadmapState({
    this.levelsStatus = CubitStatus.initial,
    this.levels = const [],
    this.failure,
  });

  RoadmapState copyWith({
    CubitStatus? levelsStatus,
    List<LevelModel>? levels,
    Failure? failure,
  }) {
    return RoadmapState(
      levelsStatus: levelsStatus ?? this.levelsStatus,
      levels: levels ?? this.levels,
      failure: failure ?? this.failure,
    );
  }
}
