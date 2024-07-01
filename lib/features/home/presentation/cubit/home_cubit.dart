import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hitbitz/features/home/domain/usecases/get_home_roadmap_usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUsecase _getCategoriesUsecase;
  final GetHomeRoadMapUsecase _getHomeRoadMapUsecase;

  HomeCubit({
    required GetCategoriesUsecase getCategoriesUsecase,
    required GetHomeRoadMapUsecase getHomeRoadMapUsecase,
  })  : _getCategoriesUsecase = getCategoriesUsecase,
        _getHomeRoadMapUsecase = getHomeRoadMapUsecase,
        super(const HomeState());

  getCategories(GetCategoriesParams params) async {
    emit(state.copyWith(categoriesStatus: CubitStatus.loading));

    final result = await _getCategoriesUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(categoriesStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(categoriesStatus: CubitStatus.success, categories: r)),
    );
  }

  getHomeRoadMap() async {
    emit(state.copyWith(homeRoadMapStatus: CubitStatus.loading));

    final result = await _getHomeRoadMapUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(homeRoadMapStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(homeRoadMapStatus: CubitStatus.success, roadMap: r)),
    );
  }
}
