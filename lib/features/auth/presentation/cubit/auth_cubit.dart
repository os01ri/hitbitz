import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/services/shared_preferences_service.dart';
import 'package:hitbitz/features/auth/data/models/user_model.dart';
import 'package:hitbitz/features/auth/domain/usecases/login_usecase.dart';
import 'package:hitbitz/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final SignInUsecase _signInUsecase;

  AuthCubit({
    required final LoginUsecase loginUsecase,
    required final SignInUsecase signInUsecase,
  })  : _loginUsecase = loginUsecase,
        _signInUsecase = signInUsecase,
        super(const AuthState());

  login(LoginParams params) async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await _loginUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(status: CubitStatus.failure, failure: l)),
      (r) {
        if (params.remember && r.accessToken != null) SharedPreferencesService.setToken(r.accessToken!);
        if (r.fullName != null) SharedPreferencesService.setFullName(r.fullName!);
        emit(state.copyWith(status: CubitStatus.success, user: r));
      },
    );
  }

  signIn(SignInParams params) async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await _signInUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(status: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(status: CubitStatus.success, user: r)),
    );
  }
}
