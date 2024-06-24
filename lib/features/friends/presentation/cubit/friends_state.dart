part of 'friends_cubit.dart';

class FriendsState {
  final CubitStatus getUsersStatus;
  final List<UserModel> users;

  const FriendsState({
    this.getUsersStatus = CubitStatus.initial,
    this.users = const [],
  });

  FriendsState copyWith({
    CubitStatus? getUsersStatus,
    List<UserModel>? users,
  }) {
    return FriendsState(
      getUsersStatus: getUsersStatus ?? this.getUsersStatus,
      users: users ?? this.users,
    );
  }
}
