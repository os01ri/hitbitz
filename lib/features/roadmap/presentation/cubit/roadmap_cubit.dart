import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/get_levels_usecase.dart';
import 'package:injectable/injectable.dart';

part 'roadmap_state.dart';

@injectable
class RoadmapCubit extends Cubit<RoadmapState> {
  final GetLevelsUsecase _getLevelsUsecase;

  RoadmapCubit({
    required GetLevelsUsecase getLevelsUsecase,
  })  : _getLevelsUsecase = getLevelsUsecase,
        super(const RoadmapState());

  getLevels(GetLevelsParams params) async {
    emit(state.copyWith(levelsStatus: CubitStatus.loading));

    final result = await _getLevelsUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(levelsStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(levelsStatus: CubitStatus.success, levels: r)),
    );
  }
}
