import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/features/friends/domain/usecases/get_users_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/send_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/show_user_usecase.dart';
import 'package:injectable/injectable.dart';

part 'friends_state.dart';

@lazySingleton
class FriendsCubit extends Cubit<FriendsState> {
  final GetUsersUsecase _getUsersUsecase;
  final ShowUserUsecase _showUserUsecase;
  final SendFriendRequestUsecase _sendFriendRequestUsecase;

  FriendsCubit({
    required GetUsersUsecase getUsersUsecase,
    required ShowUserUsecase showUserUsecase,
    required SendFriendRequestUsecase sendFriendRequestUsecase,
  })  : _getUsersUsecase = getUsersUsecase,
        _showUserUsecase = showUserUsecase,
        _sendFriendRequestUsecase = sendFriendRequestUsecase,
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

  sendRequest(SendFriendRequestParams params) async {
    emit(state.copyWith(sendRequestStatus: CubitStatus.loading));

    final result = await _sendFriendRequestUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(sendRequestStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(sendRequestStatus: CubitStatus.success)),
    );
  }
}
