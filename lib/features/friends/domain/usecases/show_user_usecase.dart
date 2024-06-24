import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowUserUsecase implements UseCase<UserModel, ShowUserParams> {
  final FriendsRepository repository;

  const ShowUserUsecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(ShowUserParams params) async {
    return repository.showUser(id: params.id, params: params.getParams());
  }
}

class ShowUserParams implements UseCaseParams {
  final int id;

  const ShowUserParams({required this.id});

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {};
}
