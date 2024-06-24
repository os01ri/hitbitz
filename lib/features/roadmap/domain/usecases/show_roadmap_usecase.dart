import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowRoadMapUsecase implements UseCase<RoadMapModel, ShowRoadMapParams> {
  final RoadMapRepository repository;

  ShowRoadMapUsecase({required this.repository});
  @override
  Future<Either<Failure, RoadMapModel>> call(ShowRoadMapParams params) async {
    return repository.showRoadMap(id: params.roadmapId, params: params.getParams());
  }
}

class ShowRoadMapParams implements UseCaseParams {
  final int roadmapId;

  const ShowRoadMapParams({required this.roadmapId});

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {};
}
