import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/home/domain/repositories/home_repository.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHomeRoadMapUsecase implements UseCase<RoadMapModel, NoParams> {
  final HomeRepository repository;

  const GetHomeRoadMapUsecase({required this.repository});

  @override
  Future<Either<Failure, RoadMapModel>> call(NoParams params) async {
    return repository.getHomeRoadmap(params: params.getParams());
  }
}
