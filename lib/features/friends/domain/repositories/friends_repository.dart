import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';

abstract class FriendsRepository {
  Future<Either<Failure, List<UserProfileModel>>> getUsers({required ParamsMap params});
  Future<Either<Failure, UserProfileModel>> showUser({required int id, required ParamsMap params});
  Future<Either<Failure, List<UserProfileModel>>> getFriends({required ParamsMap params});
  Future<Either<Failure, List<UserProfileModel>>> getFriendRequests({required ParamsMap params});
  Future<Either<Failure, NoResponse>> acceptFriendRequest({required BodyMap body});
  Future<Either<Failure, NoResponse>> sendFriendRequest({required BodyMap body});
}
