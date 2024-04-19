import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoadMapToggleBookmarkUsecase implements UseCase<NoResponse, RoadMapToggleBookmarkParams> {
  final RoadMapRepository repository;

  RoadMapToggleBookmarkUsecase({required this.repository});
  @override
  Future<Either<Failure, NoResponse>> call(RoadMapToggleBookmarkParams params) async {
    return repository.roadMapToggleBookmark(id: params.roadmapId);
  }
}

class RoadMapToggleBookmarkParams {
  final int roadmapId;

  const RoadMapToggleBookmarkParams({required this.roadmapId});
}
