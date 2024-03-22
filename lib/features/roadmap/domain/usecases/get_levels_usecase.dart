import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLevelsUsecase implements UseCase<List<LevelModel>, GetLevelsParams> {
  final RoadMapRepository repository;

  GetLevelsUsecase({required this.repository});
  @override
  Future<Either<Failure, List<LevelModel>>> call(GetLevelsParams params) async {
    return repository.getLevels(params: params.getParams());
  }
}

class GetLevelsParams implements UseCaseParams {
  final int roadmapId;

  const GetLevelsParams({required this.roadmapId});

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {'filter[roadmap_id]': roadmapId.toString()};
}
