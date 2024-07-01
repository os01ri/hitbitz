import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/time_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/friends/domain/usecases/show_user_usecase.dart';
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProfileWidget(id: id),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late final FriendsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<FriendsCubit>()..showUser(ShowUserParams(id: widget.id));
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: _cubit,
        child: BlocBuilder<FriendsCubit, FriendsState>(
          builder: (context, state) => switch (state.showUserStatus) {
            CubitStatus.initial => const SizedBox.shrink(),
            CubitStatus.loading => const LoadingWidget().center(),
            CubitStatus.failure => ErrorButtonWidget(onTap: () => _cubit.showUser(ShowUserParams(id: widget.id))),
            CubitStatus.success => Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(width: context.width),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.width),
                    child: SizedBox(
                      width: context.width * .45,
                      child: ImageWidget(path: state.user!.profileImage?.mediaUrl ?? ''),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(10),
                      TextWidget(
                        state.user!.fullName,
                        style: context.textTheme.titleLarge,
                      ),
                      const Gap(5),
                      TextWidget('@${state.user!.userName}'),
                      TextWidget(state.user!.email),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month),
                          TextWidget(state.user!.birthDate?.formatDate()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
