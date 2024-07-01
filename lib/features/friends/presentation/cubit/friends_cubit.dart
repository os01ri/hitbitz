import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/features/friends/domain/usecases/accept_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/get_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/get_friends_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/get_users_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/send_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/show_user_usecase.dart';
import 'package:injectable/injectable.dart';

part 'friends_state.dart';

@injectable
class FriendsCubit extends Cubit<FriendsState> {
  final GetUsersUsecase _getUsersUsecase;
  final ShowUserUsecase _showUserUsecase;
  final GetFriendsUsecase _getFriendsUsecase;
  final GetFriendRequestsUsecase _getFriendRequestUsecase;
  final SendFriendRequestUsecase _sendFriendRequestUsecase;
  final AcceptFriendRequestUsecase _acceptFriendRequestUsecase;

  FriendsCubit({
    required GetUsersUsecase getUsersUsecase,
    required ShowUserUsecase showUserUsecase,
    required GetFriendsUsecase getFriendsUsecase,
    required GetFriendRequestsUsecase getFriendRequestUsecase,
    required SendFriendRequestUsecase sendFriendRequestUsecase,
    required AcceptFriendRequestUsecase acceptFriendRequestUsecase,
  })  : _getUsersUsecase = getUsersUsecase,
        _showUserUsecase = showUserUsecase,
        _getFriendsUsecase = getFriendsUsecase,
        _getFriendRequestUsecase = getFriendRequestUsecase,
        _sendFriendRequestUsecase = sendFriendRequestUsecase,
        _acceptFriendRequestUsecase = acceptFriendRequestUsecase,
        super(const FriendsState());

  getUsers() async {
    emit(state.copyWith(getUsersStatus: CubitStatus.loading));

    final result = await _getUsersUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getUsersStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(getUsersStatus: CubitStatus.success, users: r)),
    );
  }

  showUser(ShowUserParams params) async {
    emit(state.copyWith(showUserStatus: CubitStatus.loading));

    final result = await _showUserUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(showUserStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(showUserStatus: CubitStatus.success, user: r)),
    );
  }

  getFriends() async {
    emit(state.copyWith(getUsersStatus: CubitStatus.loading));

    final result = await _getFriendsUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getUsersStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(getUsersStatus: CubitStatus.success, users: r)),
    );
  }

  getFriendRequests() async {
    emit(state.copyWith(getUsersStatus: CubitStatus.loading));

    final result = await _getFriendRequestUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getUsersStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(getUsersStatus: CubitStatus.success, users: r)),
    );
  }

  sendFriendRequest(FriendRequestParams params) async {
    emit(state.copyWith(requestStatus: CubitStatus.loading));

    final result = await _sendFriendRequestUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(requestStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(requestStatus: CubitStatus.success)),
    );

    emit(state.copyWith(requestStatus: CubitStatus.initial));
  }

  acceptFriendRequest(AcceptFriendRequestParams params) async {
    emit(state.copyWith(requestStatus: CubitStatus.loading));

    final result = await _acceptFriendRequestUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(requestStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(requestStatus: CubitStatus.success)),
    );

    emit(state.copyWith(requestStatus: CubitStatus.initial));
  }
}
