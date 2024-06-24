import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';

abstract class FriendsRepository {
  Future<Either<Failure, List<UserModel>>> getUsers({required ParamsMap params});
  Future<Either<Failure, UserModel>> showUser({required int id, required ParamsMap params});
}
