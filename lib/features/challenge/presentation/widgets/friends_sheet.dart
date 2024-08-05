import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
import 'package:hitbitz/features/challenge/domain/usecases/invite_to_challenge_usecase.dart';
import 'package:hitbitz/features/challenge/presentation/cubit/challenge_cubit.dart';

class ChallengeFriendsSheet extends StatelessWidget {
  final int quizId;
  final void Function(int)? onFriendSelected;

  const ChallengeFriendsSheet({
    super.key,
    required this.quizId,
    this.onFriendSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .5,
      maxChildSize: 1,
      minChildSize: .35,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: ShapeDecoration(
          color: context.colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              AppStrings.selectFriendToChallenge,
              maxLines: 3,
              style: context.textTheme.titleMedium,
            ).wrapPadding(AppPadding.bottomSheetPadding),
            const Gap(10),
            CustomScrollView(
              controller: scrollController,
              slivers: [
                BlocProvider.value(
                  value: di<ChallengeCubit>()..getFriends(),
                  child: BlocConsumer<ChallengeCubit, ChallengeState>(
                    listener: _listener,
                    builder: (context, state) => switch (state.getFriendsStatus) {
                      CubitStatus.initial => const SliverToBoxAdapter(child: SizedBox.shrink()),
                      CubitStatus.loading => SliverToBoxAdapter(child: const LoadingWidget().center()),
                      CubitStatus.failure => SliverToBoxAdapter(child: ErrorButtonWidget(onTap: di<ChallengeCubit>().getFriends).center()),
                      CubitStatus.success => SliverList.builder(
                          itemCount: state.friends.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              di<ChallengeCubit>().inviteToChallenge(InviteToChallengeParams(
                                guestId: state.friends[index].id,
                                quizId: quizId,
                              ));
                            },
                            leading: ImageWidget(width: 50, path: state.friends[index].profileImage?.mediaUrl ?? ''),
                            title: TextWidget(state.friends[index].fullName),
                            subtitle: TextWidget('@${state.friends[index].userName}'),
                          ),
                        ),
                    },
                  ),
                ),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, ChallengeState state) {
    if (state.inviteStatus == CubitStatus.loading) {
      Toaster.showLoading();
    } else if (state.inviteStatus == CubitStatus.failure) {
      Toaster.closeLoading();
      Toaster.showError(context: context, message: state.failure?.message);
    } else if (state.inviteStatus == CubitStatus.success) {
      Toaster.closeLoading();
      context.pop();
      onFriendSelected?.call(state.challenge!.id);
    }
  }
}
