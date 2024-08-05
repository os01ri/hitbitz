import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/friends/domain/usecases/send_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:hitbitz/features/friends/presentation/widgets/users_list.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late final FriendsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<FriendsCubit>()..getUsers();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<FriendsCubit, FriendsState>(
        listener: _listener,
        builder: (context, state) {
          return switch (state.getUsersStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure => ErrorButtonWidget(onTap: _cubit.getUsers).center(),
            CubitStatus.success => RefreshIndicator(
                onRefresh: () async => _cubit.getUsers(),
                child: UsersList(
                  users: state.users,
                  onTailingTapped: (id) => _cubit.sendFriendRequest(FriendRequestParams(id: id)),
                ),
              ),
          };
        },
      ),
    );
  }

  _listener(BuildContext context, FriendsState state) {
    if (state.requestStatus == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.requestStatus == CubitStatus.failure) {
      Toaster.closeLoading();
      Toaster.showError(context: context, message: state.failure?.message);
    } else if (state.requestStatus == CubitStatus.success) {
      Toaster.closeLoading();
      Toaster.showSuccess(context: context, message: AppStrings.success);
    }
  }
}
