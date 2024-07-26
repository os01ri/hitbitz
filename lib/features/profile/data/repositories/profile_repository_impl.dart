import 'package:dartz/dartz.dart';
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
}
