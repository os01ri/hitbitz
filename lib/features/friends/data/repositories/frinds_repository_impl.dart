import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/friends/data/datasources/remote_friends_datasource.dart';
import 'package:hitbitz/features/friends/domain/repositories/friends_repository.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FriendsRepository)
class FriendsRepositoryImpl with RepositoryExceptionHandler implements FriendsRepository {
  final RemoteFriendsDataSource remoteDataSource;

  const FriendsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<UserProfileModel>>> getUsers({required ParamsMap params}) {
    return exceptionHandler<List<UserProfileModel>>(tryCall: () async {
      final result = await remoteDataSource.getUsers(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, UserProfileModel>> showUser({required int id, required ParamsMap? params}) {
    return exceptionHandler<UserProfileModel>(tryCall: () async {
      final result = await remoteDataSource.showUser(id: id, params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, List<UserProfileModel>>> getFriends({required ParamsMap? params}) {
    return exceptionHandler<List<UserProfileModel>>(tryCall: () async {
      final result = await remoteDataSource.getFriends(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, List<UserProfileModel>>> getFriendRequests({required ParamsMap? params}) {
    return exceptionHandler<List<UserProfileModel>>(tryCall: () async {
      final result = await remoteDataSource.getFriendRequests(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> acceptFriendRequest({required BodyMap body}) {
    return exceptionHandler<NoResponse>(tryCall: () async {
      final result = await remoteDataSource.acceptFriendRequest(body: body);
      return Right(result);
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
