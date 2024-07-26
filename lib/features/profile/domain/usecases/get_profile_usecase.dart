import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:hitbitz/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileUsecase implements UseCase<UserProfileModel, NoParams> {
  final ProfileRepository repository;

  GetProfileUsecase({required this.repository});
  @override
  Future<Either<Failure, UserProfileModel>> call(NoParams params) async {
    return repository.getProfile();
  }
}
