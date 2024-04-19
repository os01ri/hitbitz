import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSavedRoadmapsUsecase implements UseCase<List<RoadMapModel>, NoParams> {
  final RoadMapRepository repository;

  GetSavedRoadmapsUsecase({required this.repository});
  @override
  Future<Either<Failure, List<RoadMapModel>>> call(NoParams params) async {
    return repository.getSavedRoadmaps(params: params.getParams());
  }
}
