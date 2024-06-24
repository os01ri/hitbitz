import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserDataModel>> login({required BodyMap body});
  Future<Either<Failure, UserDataModel>> signIn({required BodyMap body});
}
