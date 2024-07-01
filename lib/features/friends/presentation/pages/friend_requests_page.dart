import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/friends/domain/usecases/accept_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:hitbitz/features/friends/presentation/widgets/users_list.dart';

class FriendRequestsPage extends StatefulWidget {
  const FriendRequestsPage({super.key});

  @override
  State<FriendRequestsPage> createState() => _FriendRequestsPageState();
}

class _FriendRequestsPageState extends State<FriendRequestsPage> {
  late final FriendsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<FriendsCubit>()..getFriendRequests();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(AppStrings.friendRequests),
      ),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<FriendsCubit, FriendsState>(
          listener: _listener,
          builder: (context, state) {
            return switch (state.getUsersStatus) {
              CubitStatus.initial => const SizedBox.shrink(),
              CubitStatus.loading => const LoadingWidget().center(),
              CubitStatus.failure => ErrorButtonWidget(onTap: _cubit.getFriendRequests).center(),
              CubitStatus.success => RefreshIndicator(
                  onRefresh: () async => _cubit.getFriendRequests(),
                  child: UsersList(
                    users: state.users,
                    trailingIcon: Icons.check,
                    onTailingTapped: (id) => _cubit.acceptFriendRequest(AcceptFriendRequestParams(id: id)),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }

  _listener(BuildContext context, FriendsState state) {
    if (state.requestStatus == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.requestStatus == CubitStatus.failure) {
      Toaster.closeLoading();
      Toaster.showError(context: context, message: AppStrings.error);
    } else if (state.requestStatus == CubitStatus.success) {
      Toaster.closeLoading();
      Toaster.showSuccess(context: context, message: AppStrings.success);
      _cubit.getFriendRequests();
    }
  }
}
