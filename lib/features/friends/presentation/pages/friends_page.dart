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
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:hitbitz/features/friends/presentation/widgets/users_list.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late final FriendsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<FriendsCubit>()..getFriends();
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
        title: const TextWidget(AppStrings.friends),
      ),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocConsumer<FriendsCubit, FriendsState>(
          listener: _listener,
          builder: (context, state) {
            return switch (state.getUsersStatus) {
              CubitStatus.initial => const SizedBox.shrink(),
              CubitStatus.loading => const LoadingWidget().center(),
              CubitStatus.failure => ErrorButtonWidget(onTap: _cubit.getFriends).center(),
              CubitStatus.success => RefreshIndicator(
                  onRefresh: () async => _cubit.getFriends(),
                  child: UsersList(
                    users: state.users,
                    trailingIcon: Icons.close,
                    // onTailingTapped: (id) => _cubit.acceptFriendRequest(FriendRequestParams(id: id)),
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
    }
  }
}
