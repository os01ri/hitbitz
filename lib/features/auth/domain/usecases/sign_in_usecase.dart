import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/auth/data/models/user_model.dart';
import 'package:hitbitz/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase implements UseCase<UserDataModel, SignInParams> {
  final AuthRepository repository;

  SignInUsecase({required this.repository});
  @override
  Future<Either<Failure, UserDataModel>> call(SignInParams params) async {
    return repository.signIn(body: params.getBody());
  }
}

class SignInParams implements UseCaseParams {
  final String userName;
  final String fullName;
  final String email;
  final String password;
  final DateTime birthDate;

  const SignInParams({
    required this.userName,
    required this.fullName,
    required this.email,
    required this.password,
    required this.birthDate,
  });

  @override
  BodyMap getBody() => {
        'email': email,
        'userName': userName,
        'password': password,
        'fullName': fullName,
        'birthDate': birthDate.formatDate(),
      };

  @override
  ParamsMap? getParams() => {};
}
