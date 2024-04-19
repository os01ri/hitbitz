part of 'roadmap_cubit.dart';

class RoadmapState {
  final CubitStatus roadMapsStatus;
  final List<RoadMapModel> roadMaps;
  final CubitStatus saveStatus;
  final List<RoadMapModel> savedRoadMaps;
  final CubitStatus levelsStatus;
  final List<LevelModel> levels;
  final CubitStatus stepsStatus;
  final List<StepModel> steps;
  final Failure? failure;

  const RoadmapState({
    this.roadMapsStatus = CubitStatus.initial,
    this.roadMaps = const [],
    this.saveStatus = CubitStatus.initial,
    this.savedRoadMaps = const [],
    this.levelsStatus = CubitStatus.initial,
    this.levels = const [],
    this.stepsStatus = CubitStatus.initial,
    this.steps = const [],
    this.failure,
  });

  RoadmapState copyWith({
    CubitStatus? roadMapsStatus,
    List<RoadMapModel>? roadMaps,
    CubitStatus? saveStatus,
    List<RoadMapModel>? savedRoadMaps,
    CubitStatus? levelsStatus,
    List<LevelModel>? levels,
    CubitStatus? stepsStatus,
    List<StepModel>? steps,
    Failure? failure,
  }) {
    return RoadmapState(
      roadMapsStatus: roadMapsStatus ?? this.roadMapsStatus,
      roadMaps: roadMaps ?? this.roadMaps,
      saveStatus: saveStatus ?? this.saveStatus,
      savedRoadMaps: savedRoadMaps ?? this.savedRoadMaps,
      levelsStatus: levelsStatus ?? this.levelsStatus,
      levels: levels ?? this.levels,
      stepsStatus: stepsStatus ?? this.stepsStatus,
      steps: steps ?? this.steps,
      failure: failure ?? this.failure,
    );
  }
}
