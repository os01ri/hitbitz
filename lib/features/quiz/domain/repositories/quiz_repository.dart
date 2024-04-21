import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<QuizModel>>> getQuizzes({required ParamsMap params});
  Future<Either<Failure, QuizModel>> showQuiz({required int id});
}
