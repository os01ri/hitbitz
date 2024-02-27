import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRoadMapsUsecase implements UseCase<List<RoadMapModel>, GetRoadMapsParams> {
  final HomeRepository repository;

  GetRoadMapsUsecase({required this.repository});
  @override
  Future<Either<Failure, List<RoadMapModel>>> call(GetRoadMapsParams params) async {
    return repository.getRoadMaps(body: params.getBody());
  }
}

class GetRoadMapsParams implements UseCaseParams {
  const GetRoadMapsParams();

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {};
}
