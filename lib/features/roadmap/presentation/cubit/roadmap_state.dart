part of 'roadmap_cubit.dart';

class RoadmapState {
  final CubitStatus levelsStatus;
  final List<LevelModel> levels;
  final CubitStatus stepsStatus;
  final List<StepModel> steps;
  final Failure? failure;

  const RoadmapState({
    this.levelsStatus = CubitStatus.initial,
    this.levels = const [],
    this.stepsStatus = CubitStatus.initial,
    this.steps = const [],
    this.failure,
  });

  RoadmapState copyWith({
    CubitStatus? levelsStatus,
    List<LevelModel>? levels,
    CubitStatus? stepsStatus,
    List<StepModel>? steps,
    Failure? failure,
  }) {
    return RoadmapState(
      levelsStatus: levelsStatus ?? this.levelsStatus,
      levels: levels ?? this.levels,
      stepsStatus: stepsStatus ?? this.stepsStatus,
      steps: steps ?? this.steps,
      failure: failure ?? this.failure,
    );
  }
}
