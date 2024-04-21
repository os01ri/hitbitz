import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/quiz/data/datasources/remote_quiz_datasource.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:hitbitz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuizRepository)
class QuizRepositoryImpl with RepositoryExceptionHandler implements QuizRepository {
  final RemoteQuizDataSource remoteDataSource;

  const QuizRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<QuizModel>>> getQuizzes({required ParamsMap params}) {
    return exceptionHandler<List<QuizModel>>(tryCall: () async {
      final result = await remoteDataSource.getQuizzes(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, QuizModel>> showQuiz({required int id}) {
    return exceptionHandler<QuizModel>(tryCall: () async {
      final result = await remoteDataSource.showQuiz(id: id);
      return Right(result.data);
    });
  }
}
