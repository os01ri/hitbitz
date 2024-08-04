part of 'challenge_cubit.dart';

class ChallengeState {
  final CubitStatus getStatus;
  final List<ChallengeModel> challenges;
  final CubitStatus inviteStatus;
  final CubitStatus getFriendsStatus;
  final List<UserProfileModel> friends;
  final Failure? failure;

  const ChallengeState({
    this.getStatus = CubitStatus.initial,
    this.challenges = const [],
    this.inviteStatus = CubitStatus.initial,
    this.getFriendsStatus = CubitStatus.initial,
    this.friends = const [],
    this.failure,
  });

  ChallengeState copyWith({
    CubitStatus? getStatus,
    List<ChallengeModel>? challenges,
    CubitStatus? inviteStatus,
    CubitStatus? getFriendsStatus,
    List<UserProfileModel>? friends,
    Failure? failure,
  }) {
    return ChallengeState(
      getStatus: getStatus ?? this.getStatus,
      challenges: challenges ?? this.challenges,
      inviteStatus: inviteStatus ?? this.inviteStatus,
      getFriendsStatus: getFriendsStatus ?? this.getFriendsStatus,
      friends: friends ?? this.friends,
      failure: failure ?? this.failure,
    );
  }
}
