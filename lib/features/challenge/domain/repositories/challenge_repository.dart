import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/challenge/data/models/challenge_model.dart';

abstract class ChallengeRepository {
  Future<Either<Failure, List<ChallengeModel>>> getChallenges({required ParamsMap params});
  Future<Either<Failure, ChallengeModel>> inviteToChallenge({required BodyMap body});
}
