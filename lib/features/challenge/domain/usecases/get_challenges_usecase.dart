import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/challenge/data/models/challenge_model.dart';
import 'package:hitbitz/features/challenge/domain/repositories/challenge_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetChallengesUsecase implements UseCase<List<ChallengeModel>, NoParams> {
  final ChallengeRepository repository;

  const GetChallengesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<ChallengeModel>>> call(NoParams params) async {
    return repository.getChallenges(params: {});
  }
}
