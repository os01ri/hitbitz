import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/friends/domain/usecases/show_user_usecase.dart';
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.id});

  final int id;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    di<FriendsCubit>().showUser(ShowUserParams(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider.value(
          value: di<FriendsCubit>(),
          child: BlocBuilder<FriendsCubit, FriendsState>(
            builder: (context, state) => switch (state.showUserStatus) {
              CubitStatus.initial => const SizedBox.shrink(),
              CubitStatus.loading => const LoadingWidget().center(),
              CubitStatus.failure => ErrorButtonWidget(onTap: () => di<FriendsCubit>().showUser(ShowUserParams(id: widget.id))),
              CubitStatus.success => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      child: ImageWidget(path: state.user!.profileImage?.mediaUrl ?? ''),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(state.user!.fullName),
                        TextWidget(state.user!.email),
                        TextWidget(state.user!.userName),
                        TextWidget(state.user!.birthDate?.formatDate()),
                      ],
                    ),
                  ],
                ),
            },
          ),
        ),
      ),
    );
  }
}
