import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRoadMapsUsecase implements UseCase<List<RoadMapModel>, GetRoadMapsParams> {
  final HomeRepository repository;

  GetRoadMapsUsecase({required this.repository});
  @override
  Future<Either<Failure, List<RoadMapModel>>> call(GetRoadMapsParams params) async {
    return repository.getRoadMaps(params: params.getParams(), body: params.getBody());
  }
}

class GetRoadMapsParams implements UseCaseParams {
  final int? categoryId;
  final String? name;

  const GetRoadMapsParams({
    this.categoryId,
    this.name,
  });

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {
        if (categoryId != null) 'categoryId': categoryId.toString(),
        if (name != null) 'filter[name]': name,
      };
}
