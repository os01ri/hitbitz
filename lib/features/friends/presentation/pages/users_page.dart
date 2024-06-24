import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/card_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:hitbitz/router/app_routes.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    di<FriendsCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<FriendsCubit>(),
      child: BlocBuilder<FriendsCubit, FriendsState>(
        builder: (context, state) {
          return switch (state.getUsersStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure => ErrorButtonWidget(onTap: di<FriendsCubit>().getUsers).center(),
            CubitStatus.success => RefreshIndicator(
                onRefresh: () async => di<FriendsCubit>().getUsers(),
                child: ListView.separated(
                  padding: AppPadding.listViewPadding,
                  itemCount: state.users.length,
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) => CardWidget(
                    isShadowed: true,
                    child: ListTile(
                      onTap: () => context.pushNamed(AppRoutes.profile, extra: state.users[index].id),
                      leading: ImageWidget(width: 50, path: state.users[index].profileImage?.mediaUrl ?? ''),
                      title: TextWidget(state.users[index].fullName),
                      subtitle: TextWidget(state.users[index].userName),
                      trailing: CardWidget(
                        onTap: () {},
                        height: 30,
                        width: 30,
                        borderRadius: 20,
                        color: context.colorScheme.secondary,
                        child: Icon(Icons.add, color: context.colorScheme.onSecondary),
                      ),
                    ),
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
