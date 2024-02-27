import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hitbitz/features/home/domain/usecases/get_roadmaps_usecase.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUsecase _getCategoriesUsecase;
  final GetRoadMapsUsecase _getRoadMapsUsecase;

  HomeCubit({
    required GetCategoriesUsecase getCategoriesUsecase,
    required GetRoadMapsUsecase getRoadMapsUsecase,
  })  : _getCategoriesUsecase = getCategoriesUsecase,
        _getRoadMapsUsecase = getRoadMapsUsecase,
        super(const HomeState());

  getCategories(GetCategoriesParams params) async {
    emit(state.copyWith(categoriesStatus: CubitStatus.loading));

    final result = await _getCategoriesUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(categoriesStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(categoriesStatus: CubitStatus.success, categories: r)),
    );
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
