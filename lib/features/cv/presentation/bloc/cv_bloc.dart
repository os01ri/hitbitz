import 'package:bloc/bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/cv/domain/usecases/get_categories_usecase.dart';
import 'package:hitbitz/features/cv/domain/usecases/get_roadmaps_usecase.dart';
import 'package:hitbitz/features/cv/domain/usecases/send_cv_usecase.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

import '../../../roadmap/data/models/road_map_model.dart';

part 'cv_event.dart';
part 'cv_state.dart';

@lazySingleton
class CvBloc extends Bloc<CvEvent, CvState> {
  final GetRoadmapsForCvUsecase getRoadmaps;
  final GetCategoriesForCvUsecase getCategories;
  final SendCvUsecase sendCv;
  CvBloc(
    this.getRoadmaps,
    this.getCategories,
    this.sendCv,
  ) : super(const CvState()) {
    on<SendCvEvent>((event, emit) async {
      emit(state.copyWith(cvStatus: CubitStatus.loading));
      final result = await sendCv.call(event.params);
      result.fold((l) {
        emit(state.copyWith(cvStatus: CubitStatus.failure));
      }, (r) {
        emit(state.copyWith(cvStatus: CubitStatus.success));
      });
    });
    on<GetRoadmapsForCV>((event, emit) async {
      emit(state.copyWith(indexRoadmaps: CubitStatus.loading));
      final result = await getRoadmaps.call(NoParams());
      result.fold((l) {
        emit(state.copyWith(indexRoadmaps: CubitStatus.failure));
      }, (r) {
        emit(state.copyWith(indexRoadmaps: CubitStatus.success, roadmaps: r));
      });
    });
    on<GetCategoriesForCV>((event, emit) async {
      emit(state.copyWith(indexCategories: CubitStatus.loading));
      final result = await getCategories.call(NoParams());
      result.fold((l) {
        emit(state.copyWith(indexCategories: CubitStatus.failure));
      }, (r) {
        emit(state.copyWith(
            indexCategories: CubitStatus.success, categories: r));
      });
    });
  }
}
