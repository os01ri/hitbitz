part of 'profile_cubit.dart';

class ProfileState {
  final CubitStatus getStatus;
  final UserProfileModel? profile;
  final CubitStatus updateStatus;
  final Failure? failure;

  const ProfileState({
    this.getStatus = CubitStatus.initial,
    this.profile,
    this.updateStatus = CubitStatus.initial,
    this.failure,
  });

  ProfileState copyWith({
    CubitStatus? getStatus,
    UserProfileModel? profile,
    CubitStatus? updateStatus,
    Failure? failure,
  }) {
    return ProfileState(
      getStatus: getStatus ?? this.getStatus,
      profile: profile ?? this.profile,
      updateStatus: updateStatus ?? this.updateStatus,
      failure: failure ?? this.failure,
    );
  }
}
