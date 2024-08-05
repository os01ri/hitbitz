import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompleteCustomQuizUsecase implements UseCase<NoResponse, CompleteCustomQuizParams> {
  final QuizRepository repository;

  const CompleteCustomQuizUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(CompleteCustomQuizParams params) async {
    return repository.completeCustomQuiz(params: params);
  }
}

class CompleteCustomQuizParams implements UseCaseParams {
  final int score;
  final int? roadmapId;
  final int? levelId;
  final int? stepId;

  const CompleteCustomQuizParams({
    required this.score,
    this.roadmapId,
    this.levelId,
    this.stepId,
  }) : assert(levelId != null || roadmapId != null || stepId != null);

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {
        'score': score.toString(),
        if (roadmapId != null) 'roadmapId': roadmapId.toString(),
        if (levelId != null) 'levelId': levelId.toString(),
        if (stepId != null) 'stepId': stepId.toString(),
      };
}
