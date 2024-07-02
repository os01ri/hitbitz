import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFriendsUsecase implements UseCase<List<UserModel>, NoParams> {
  final FriendsRepository repository;

  const GetFriendsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<UserModel>>> call(NoParams params) async {
    return repository.getFriends(params: params.getParams());
  }
}