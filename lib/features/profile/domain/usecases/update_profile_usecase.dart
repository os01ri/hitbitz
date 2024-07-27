import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUsecase implements UseCase<NoResponse, UpdateProfileParams> {
  final ProfileRepository repository;

  const UpdateProfileUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(UpdateProfileParams params) async {
    return repository.updateProfile(params.getBody());
  }
}

class UpdateProfileParams implements UseCaseParams {
  final String? fullName;
  final DateTime? birthDate;
  final String? profileImage;
  final int? categoryId;

  const UpdateProfileParams({
    required this.fullName,
    required this.birthDate,
    required this.profileImage,
    this.categoryId,
  });

  @override
  BodyMap getBody() => {
        if (fullName != null && fullName!.isNotEmpty) 'fullName': fullName,
        if (birthDate != null) 'birthDate': birthDate!.formatDate(),
        if (profileImage != null && fullName!.isNotEmpty) 'profileImage': profileImage,
        if (categoryId != null) 'categoryId': categoryId,
      };

  @override
  ParamsMap? getParams() {
    // TODO: implement getParams
    throw UnimplementedError();
  }
}
