import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/cv/domain/repositories/cv_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../roadmap/data/models/road_map_model.dart';

@injectable
class GetRoadmapsForCvUsecase implements UseCase<List<RoadMapModel>, NoParams> {
  final CvRepo repo;
  GetRoadmapsForCvUsecase({
    required this.repo,
  });
  @override
  Future<Either<Failure, List<RoadMapModel>>> call(NoParams params) async {
    return await repo.getRoadmaps();
  }
}
