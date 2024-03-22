import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetStepsUsecase implements UseCase<List<StepModel>, GetStepsParams> {
  final RoadMapRepository repository;

  GetStepsUsecase({required this.repository});
  @override
  Future<Either<Failure, List<StepModel>>> call(GetStepsParams params) async {
    return repository.getSteps(params: params.getParams());
  }
}

class GetStepsParams implements UseCaseParams {
  final int levelId;

  const GetStepsParams({required this.levelId});

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {'filter[level_id]': levelId.toString()};
}
