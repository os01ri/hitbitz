import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompleteQuizUsecase implements UseCase<NoResponse, CompleteQuizParams> {
  final QuizRepository repository;

  const CompleteQuizUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(CompleteQuizParams params) async {
    return repository.completeQuiz(params: params);
  }
}

class CompleteQuizParams implements UseCaseParams {
  final int id;
  final int score;

  const CompleteQuizParams({required this.id, required this.score});

  @override
  BodyMap getBody() => {'score': score};

  @override
  ParamsMap? getParams() {
    throw UnimplementedError();
  }
}
