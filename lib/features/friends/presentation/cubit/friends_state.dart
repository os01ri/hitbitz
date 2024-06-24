part of 'friends_cubit.dart';

class FriendsState {
  final CubitStatus getUsersStatus;
  final List<UserModel> users;
  final CubitStatus showUserStatus;
  final UserModel? user;
  final CubitStatus sendRequestStatus;

  const FriendsState({
    this.getUsersStatus = CubitStatus.initial,
    this.users = const [],
    this.showUserStatus = CubitStatus.initial,
    this.user,
    this.sendRequestStatus = CubitStatus.initial,
  });

  FriendsState copyWith({
    CubitStatus? getUsersStatus,
    List<UserModel>? users,
    CubitStatus? showUserStatus,
    UserModel? user,
    CubitStatus? sendRequestStatus,
  }) {
    return FriendsState(
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      users: users ?? this.users,
      showUserStatus: showUserStatus ?? this.showUserStatus,
      user: user ?? this.user,
      sendRequestStatus: sendRequestStatus ?? this.sendRequestStatus,
    );
  }
}
