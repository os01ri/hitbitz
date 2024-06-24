import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:hitbitz/features/friends/domain/usecases/get_users_usecase.dart';
import 'package:injectable/injectable.dart';

part 'friends_state.dart';

@lazySingleton
class FriendsCubit extends Cubit<FriendsState> {
  final GetUsersUsecase _getUsersUsecase;

  FriendsCubit({
    required GetUsersUsecase getUsersUsecase,
  })  : _getUsersUsecase = getUsersUsecase,
        super(const FriendsState());

  getUsers() async {
    emit(state.copyWith(getUsersStatus: CubitStatus.loading));

    final result = await _getUsersUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getUsersStatus: CubitStatus.failure)),
      (r) => emit(state.copyWith(getUsersStatus: CubitStatus.success, users: r)),
    );
  }
}
