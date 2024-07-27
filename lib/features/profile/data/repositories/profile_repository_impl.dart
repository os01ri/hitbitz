import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/profile/data/datasources/remote_profile_datasource.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:hitbitz/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl with RepositoryExceptionHandler implements ProfileRepository {
  final RemoteProfileDataSource remoteDataSource;

  const ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserProfileModel>> getProfile() {
    return exceptionHandler<UserProfileModel>(tryCall: () async {
      final result = await remoteDataSource.getProfile();
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> updateProfile(BodyMap body) {
    return exceptionHandler<NoResponse>(tryCall: () async {
      await remoteDataSource.updateProfile(body: body);
      return Right(NoResponse());
    });
  }
}
