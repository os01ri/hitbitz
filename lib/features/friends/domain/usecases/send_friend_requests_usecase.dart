import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendFriendRequestUsecase implements UseCase<NoResponse, FriendRequestParams> {
  final FriendsRepository repository;

  const SendFriendRequestUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(FriendRequestParams params) async {
    return repository.sendFriendRequest(body: params.getBody());
  }
}

class FriendRequestParams implements UseCaseParams {
  final int id;

  const FriendRequestParams({required this.id});

  @override
  BodyMap getBody() => {'friend_id': id};

  @override
  ParamsMap? getParams() => {};
}
