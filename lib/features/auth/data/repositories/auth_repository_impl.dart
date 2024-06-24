import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/auth/data/datasources/remote_auth_datasource.dart';
import 'package:hitbitz/features/auth/data/models/user_data_model.dart';
import 'package:hitbitz/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl with RepositoryExceptionHandler implements AuthRepository {
  final RemoteAuthDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserDataModel>> login({required BodyMap body}) {
    return exceptionHandler<UserDataModel>(tryCall: () async {
      final result = await remoteDataSource.logIn(body: body);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, UserDataModel>> signIn({required BodyMap body}) {
    return exceptionHandler<UserDataModel>(tryCall: () async {
      final result = await remoteDataSource.signIn(body: body);
      return Right(result.data);
    });
  }
}
