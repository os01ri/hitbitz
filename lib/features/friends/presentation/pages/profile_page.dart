import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/image_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_padding.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/core/utilities/toaster.dart';
import 'package:hitbitz/features/friends/domain/usecases/send_friend_requests_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/show_user_usecase.dart';
import 'package:hitbitz/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:hitbitz/features/profile/presentation/widgets/profile_widget.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/presentation/pages/roadmap_page.dart';
import 'package:hitbitz/router/app_routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.id});

  final int id;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocListener<FriendsCubit, FriendsState>(
          listener: _listener,
          child: FriendProfileWidget(id: widget.id),
        ).wrapPadding(AppPadding.pagePadding),
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

class FriendProfileWidget extends StatefulWidget {
  const FriendProfileWidget({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<FriendProfileWidget> createState() => _FriendProfileWidgetState();
}

class _FriendProfileWidgetState extends State<FriendProfileWidget> {
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
                children: [
                  ProfileWidget(userProfile: state.user!),
                  const Gap(10),
                  ButtonWidget(
                    text: AppStrings.add,
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: context.colorScheme.onPrimary,
                    width: context.width,
                    onPressed: () => _cubit.sendFriendRequest(FriendRequestParams(id: widget.id)),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: context.width,
                    child: TextWidget(
                      AppStrings.roadmaps,
                      textAlign: TextAlign.start,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  const Gap(10),
                  UserRoadMapsList(roadmaps: state.user!.roadmaps).expand(),
                ],
              ),
          },
        ),
      ),
    );
  }
}

class UserRoadMapsList extends StatelessWidget {
  const UserRoadMapsList({super.key, required this.roadmaps});

  final List<RoadMapModel> roadmaps;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: roadmaps.length,
      separatorBuilder: (context, index) => const Gap(5),
      itemBuilder: (context, index) => Card(
        margin: AppPadding.zero,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          onTap: () => context.pushNamed(
            AppRoutes.roadmap,
            extra: RoadMapPageArguments(
              roadMap: roadmaps[index],
              isStarting: false,
            ),
          ),
          leading: ImageWidget(
            path: roadmaps[index].media?.mediaUrl ?? '',
            width: 80,
            height: 80,
          ),
          // isThreeLine: true,
          title: TextWidget(
            '${roadmaps[index].name ?? ''}\n${roadmaps[index].progress}%',
            maxLines: 3,
          ),
          subtitle: LinearProgressIndicator(
            value: (roadmaps[index].progress ?? 0) * .01,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff7E57C2),
          ),
        ),
      ),
    );
  }
}
