import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/home/domain/usecases/get_roadmaps_usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_levels_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_steps_usecase.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart';
import 'package:injectable/injectable.dart';

part 'roadmap_state.dart';

@lazySingleton
class RoadmapCubit extends Cubit<RoadmapState> {
  final GetLevelsUsecase _getLevelsUsecase;
  final GetStepsUsecase _getStepsUsecase;
  final RoadMapToggleBookmarkUsecase _roadMapToggleBookmarkUsecase;
  final GetSavedRoadmapsUsecase _getSavedRoadmapsUsecase;
  final GetRoadMapsUsecase _getRoadMapsUsecase;

  RoadmapCubit({
    required GetLevelsUsecase getLevelsUsecase,
    required GetStepsUsecase getStepsUsecase,
    required RoadMapToggleBookmarkUsecase roadMapToggleBookmarkUsecase,
    required GetSavedRoadmapsUsecase getSavedRoadmapsUsecase,
    required GetRoadMapsUsecase getRoadMapsUsecase,
  })  : _getLevelsUsecase = getLevelsUsecase,
        _getStepsUsecase = getStepsUsecase,
        _roadMapToggleBookmarkUsecase = roadMapToggleBookmarkUsecase,
        _getSavedRoadmapsUsecase = getSavedRoadmapsUsecase,
        _getRoadMapsUsecase = getRoadMapsUsecase,
        super(const RoadmapState());

  getLevels(GetLevelsParams params) async {
    emit(state.copyWith(levelsStatus: CubitStatus.loading));

    final result = await _getLevelsUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(levelsStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(levelsStatus: CubitStatus.success, levels: r)),
    );
  }

  getSteps(GetStepsParams params) async {
    emit(state.copyWith(stepsStatus: CubitStatus.loading));

    final result = await _getStepsUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(stepsStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(stepsStatus: CubitStatus.success, steps: r)),
    );
  }

  roadMapToggleBookmark(RoadMapToggleBookmarkParams params) async {
    emit(state.copyWith(saveStatus: CubitStatus.loading));

    final result = await _roadMapToggleBookmarkUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(saveStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(saveStatus: CubitStatus.success)),
    );

    emit(state.copyWith(saveStatus: CubitStatus.initial));
  }

  getSavedRoadmaps() async {
    emit(state.copyWith(saveStatus: CubitStatus.loading));

    final result = await _getSavedRoadmapsUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(saveStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(saveStatus: CubitStatus.success, savedRoadMaps: r)),
    );

    emit(state.copyWith(saveStatus: CubitStatus.initial));
  }

  getRoadMaps(GetRoadMapsParams params) async {
    emit(state.copyWith(roadMapsStatus: CubitStatus.loading));

    final result = await _getRoadMapsUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(roadMapsStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(roadMapsStatus: CubitStatus.success, roadMaps: r)),
    );
  }
}
