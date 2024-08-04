import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/challenge/data/datasources/remote_challenge_datasource.dart';
import 'package:hitbitz/features/challenge/data/models/challenge_model.dart';
import 'package:hitbitz/features/challenge/domain/repositories/challenge_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChallengeRepository)
class ChallengeRepositoryImpl with RepositoryExceptionHandler implements ChallengeRepository {
  final RemoteChallengeDataSource remoteDataSource;

  const ChallengeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ChallengeModel>>> getChallenges({required ParamsMap params}) {
    return exceptionHandler<List<ChallengeModel>>(tryCall: () async {
      final result = await remoteDataSource.getChallenges(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, ChallengeModel>> inviteToChallenge({required BodyMap body}) {
    return exceptionHandler<ChallengeModel>(tryCall: () async {
      final result = await remoteDataSource.inviteToChallenge(body: body);
      return Right(result.data);
    });
  }
}
