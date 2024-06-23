import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuizzesUsecase implements UseCase<List<QuizModel>, GetQuizzedParams> {
  final QuizRepository repository;

  const GetQuizzesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<QuizModel>>> call(GetQuizzedParams params) async {
    return repository.getQuizzes(params: params.getParams());
  }
}

class GetQuizzedParams implements UseCaseParams {
  final int stepId;

  const GetQuizzedParams({required this.stepId});

  @override
  BodyMap getBody() {
    // TODO: implement getBody
    throw UnimplementedError();
  }

  @override
  ParamsMap? getParams() => {'filter[level_detail_id]': stepId.toString()};
}
