import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
 import 'package:injectable/injectable.dart';

@injectable
class AcceptFriendRequestUsecase implements UseCase<NoResponse, AcceptFriendRequestParams> {
  final FriendsRepository repository;

  const AcceptFriendRequestUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(AcceptFriendRequestParams params) async {
    return repository.acceptFriendRequest(body: params.getBody());
  }
}


class AcceptFriendRequestParams implements UseCaseParams {
  final int id;

  const AcceptFriendRequestParams({required this.id});

  @override
  BodyMap getBody() => {'request_id': id};

  @override
  ParamsMap? getParams() => {};
}
