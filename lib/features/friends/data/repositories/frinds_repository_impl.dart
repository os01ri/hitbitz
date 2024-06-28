import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/friends/data/datasources/remote_friends_datasource.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FriendsRepository)
class FriendsRepositoryImpl with RepositoryExceptionHandler implements FriendsRepository {
  final RemoteFriendsDataSource remoteDataSource;

  const FriendsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<UserModel>>> getUsers({required ParamsMap params}) {
    return exceptionHandler<List<UserModel>>(tryCall: () async {
      final result = await remoteDataSource.getUsers(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, UserModel>> showUser({required int id, required ParamsMap? params}) {
    return exceptionHandler<UserModel>(tryCall: () async {
      final result = await remoteDataSource.showUser(id: id, params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> sendFriendRequest({required BodyMap body}) {
    return exceptionHandler<NoResponse>(tryCall: () async {
      final result = await remoteDataSource.sendFriendRequest(body: body);
      return Right(result);
    });
  }
}