import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/auth/data/models/user_data_model.dart';
import 'package:hitbitz/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase implements UseCase<UserDataModel, LoginParams> {
  final AuthRepository repository;

  LoginUsecase({required this.repository});
  @override
  Future<Either<Failure, UserDataModel>> call(LoginParams params) async {
    return repository.login(body: params.getBody());
  }
}

class LoginParams implements UseCaseParams {
  final String username;
  final String password;
  final bool remember;

  const LoginParams({
    required this.username,
    required this.password,
    this.remember = false,
  });

  @override
  BodyMap getBody() => {
        'userName': username,
        'password': password,
      };

  @override
  ParamsMap? getParams() => {};
}
