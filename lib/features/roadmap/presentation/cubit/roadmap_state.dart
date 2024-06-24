part of 'roadmap_cubit.dart';

class RoadmapState {
  final CubitStatus roadMapsStatus;
  final List<RoadMapModel> roadMaps;
  final CubitStatus saveStatus;
  final List<RoadMapModel> savedRoadMaps;
  final CubitStatus roadmapStatus;
  final RoadMapModel? roadmap;
  final CubitStatus stepsStatus;
  final List<StepModel> steps;
  final Failure? failure;

  const RoadmapState({
    this.roadMapsStatus = CubitStatus.initial,
    this.roadMaps = const [],
    this.saveStatus = CubitStatus.initial,
    this.savedRoadMaps = const [],
    this.roadmapStatus = CubitStatus.initial,
    this.roadmap,
    this.stepsStatus = CubitStatus.initial,
    this.steps = const [],
    this.failure,
  });

  RoadmapState copyWith({
    CubitStatus? roadMapsStatus,
    List<RoadMapModel>? roadMaps,
    CubitStatus? saveStatus,
    List<RoadMapModel>? savedRoadMaps,
    CubitStatus? roadmapStatus,
    RoadMapModel? roadmap,
    CubitStatus? stepsStatus,
    List<StepModel>? steps,
    Failure? failure,
  }) {
    return RoadmapState(
      roadMapsStatus: roadMapsStatus ?? this.roadMapsStatus,
      roadMaps: roadMaps ?? this.roadMaps,
      saveStatus: saveStatus ?? this.saveStatus,
      savedRoadMaps: savedRoadMaps ?? this.savedRoadMaps,
      roadmapStatus: roadmapStatus ?? this.roadmapStatus,
      roadmap: roadmap ?? this.roadmap,
      stepsStatus: stepsStatus ?? this.stepsStatus,
      steps: steps ?? this.steps,
      failure: failure ?? this.failure,
    );
  }
}
