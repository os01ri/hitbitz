import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowQuizUsecase implements UseCase<QuizModel, int> {
  final QuizRepository repository;

  const ShowQuizUsecase({required this.repository});

  @override
  Future<Either<Failure, QuizModel>> call(int id) async {
    return repository.showQuiz(id: id);
  }
}
