part of 'auth_cubit.dart';

class AuthState {
  final CubitStatus status;
  final UserDataModel? user;
  final Failure? failure;

  const AuthState({
    this.status = CubitStatus.initial,
    this.user,
    this.failure,
  });

  AuthState copyWith({
    CubitStatus? status,
    UserDataModel? user,
    Failure? failure,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }
}
