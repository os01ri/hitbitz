import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFriendsUsecase implements UseCase<List<UserProfileModel>, NoParams> {
  final FriendsRepository repository;

  const GetFriendsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<UserProfileModel>>> call(NoParams params) async {
    return repository.getFriends(params: params.getParams());
  }
}
