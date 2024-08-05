import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase implements UseCase<NoResponse, ForgetPasswordParams> {
  final AuthRepository repository;

  const ForgetPasswordUsecase({required this.repository});

  @override
  Future<Either<Failure, NoResponse>> call(ForgetPasswordParams params) async {
    return repository.forgetPassword(body: params.getBody());
  }
}

class ForgetPasswordParams implements UseCaseParams {
  final String email;

  const ForgetPasswordParams({
    required this.email,
  });

  @override
  BodyMap getBody() => {'email': email};

  @override
  ParamsMap? getParams() => {};
}
