import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase implements UseCase<NoResponse, ResetPasswordParams> {
  final AuthRepository repository;

  const ResetPasswordUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(ResetPasswordParams params) async {
    return repository.resetPassword(body: params.getBody());
  }
}

class ResetPasswordParams implements UseCaseParams {
  final String email;
  final String code;
  final String newPassword;

  const ResetPasswordParams({
    required this.email,
    required this.code,
    required this.newPassword,
  });

  @override
  BodyMap getBody() => {
        'email': email,
        'code': code,
        'newPassword': code,
      };

  @override
  ParamsMap? getParams() => {};
}
