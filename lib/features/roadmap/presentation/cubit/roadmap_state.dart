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
  final CubitStatus customQuizStatus;
  final QuizModel? customQuiz;
  final CubitStatus certificateStatus;
  final String? certificateUrl;
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
    this.customQuizStatus = CubitStatus.initial,
    this.customQuiz,
    this.certificateStatus = CubitStatus.initial,
    this.certificateUrl,
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
    CubitStatus? customQuizStatus,
    QuizModel? customQuiz,
    CubitStatus? certificateStatus,
    String? certificateUrl,
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
      customQuizStatus: customQuizStatus ?? this.customQuizStatus,
      customQuiz: customQuiz ?? this.customQuiz,
      certificateStatus: certificateStatus ?? this.certificateStatus,
      certificateUrl: certificateUrl ?? this.certificateUrl,
      failure: failure ?? this.failure,
    );
  }
}
