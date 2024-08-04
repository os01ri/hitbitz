import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/challenge/data/models/challenge_model.dart';
import 'package:hitbitz/features/challenge/domain/repositories/challenge_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InviteToChallengeUsecase implements UseCase<ChallengeModel, InviteToChallengeParams> {
  final ChallengeRepository repository;

  const InviteToChallengeUsecase({required this.repository});

  @override
  Future<Either<Failure, ChallengeModel>> call(InviteToChallengeParams params) async {
    return repository.inviteToChallenge(body: params.getBody());
  }
}

class InviteToChallengeParams implements UseCaseParams {
  final int guestId;
  final int quizId;

  const InviteToChallengeParams({required this.guestId, required this.quizId});

  @override
  BodyMap getBody() => {
        'quiz_id': quizId,
        'guest_id': guestId,
      };

  @override
  ParamsMap? getParams() {
    throw UnimplementedError();
  }
}
