import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/quiz/data/models/question_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCustomQuizUsecase implements UseCase<List<QuestionModel>, CreateCustomQuizParams> {
  final RoadMapRepository repository;

  const CreateCustomQuizUsecase({required this.repository});

  @override
  Future<Either<Failure, List<QuestionModel>>> call(CreateCustomQuizParams params) async {
    return repository.createCustomQuiz(params: params.getParams());
  }
}

class CreateCustomQuizParams implements UseCaseParams {
  final int? roadmapId;
  final int? levelId;
  final int? stepId;

  const CreateCustomQuizParams({
    this.roadmapId,
    this.levelId,
    this.stepId,
  }) : assert(levelId != null || roadmapId != null || stepId != null);

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {
        if (roadmapId != null) 'roadmapId': roadmapId.toString(),
        if (levelId != null) 'levelId': levelId.toString(),
        if (stepId != null) 'stepId': stepId.toString(),
      };
}
