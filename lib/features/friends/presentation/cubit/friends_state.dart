part of 'friends_cubit.dart';

class FriendsState {
  final CubitStatus getUsersStatus;
  final List<UserProfileModel> users;
  final CubitStatus showUserStatus;
  final UserProfileModel? user;
  final CubitStatus requestStatus;
  final Failure? failure;

  const FriendsState({
    this.getUsersStatus = CubitStatus.initial,
    this.users = const [],
    this.showUserStatus = CubitStatus.initial,
    this.user,
    this.requestStatus = CubitStatus.initial,
    this.failure,
  });

  FriendsState copyWith({
    CubitStatus? getUsersStatus,
    List<UserProfileModel>? users,
    CubitStatus? showUserStatus,
    UserProfileModel? user,
    CubitStatus? requestStatus,
    Failure? failure,
  }) {
    return FriendsState(
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      users: users ?? this.users,
      showUserStatus: showUserStatus ?? this.showUserStatus,
      user: user ?? this.user,
      requestStatus: requestStatus ?? this.requestStatus,
      failure: failure ?? this.failure,
    );
  }
}
