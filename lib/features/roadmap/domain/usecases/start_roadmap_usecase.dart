import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:hitbitz/features/roadmap/domain/usecases/show_roadmap_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartRoadMapUsecase implements UseCase<RoadMapModel, ShowRoadMapParams> {
  final RoadMapRepository repository;

  StartRoadMapUsecase({required this.repository});
  @override
  Future<Either<Failure, RoadMapModel>> call(ShowRoadMapParams params) async {
    return repository.startRoadMap(id: params.roadmapId, params: params.getParams());
  }
}
