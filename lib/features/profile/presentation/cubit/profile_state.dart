part of 'profile_cubit.dart';

class ProfileState {
  final CubitStatus status;
  final UserProfileModel? profile;
  final Failure? failure;

  const ProfileState({
    this.status = CubitStatus.initial,
    this.profile,
    this.failure,
  });

  ProfileState copyWith({
    CubitStatus? status,
    UserProfileModel? profile,
    Failure? failure,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      failure: failure ?? this.failure,
    );
  }
}
