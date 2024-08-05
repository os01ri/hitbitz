import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hitbitz/core/components/button_widget.dart';
import 'package:hitbitz/core/components/error_widget.dart';
import 'package:hitbitz/core/components/loading_widget.dart';
import 'package:hitbitz/core/components/text_widget.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/extensions/context_extension.dart';
import 'package:hitbitz/core/extensions/widget_extensions.dart';
import 'package:hitbitz/core/services/di/di_container.dart';
import 'package:hitbitz/features/challenge/presentation/cubit/challenge_cubit.dart';
import 'package:hitbitz/features/friends/presentation/widgets/users_list.dart';
import 'package:hitbitz/features/quiz/presentation/pages/quiz_intro_page.dart';
import 'package:hitbitz/router/app_routes.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key, required this.currentUserIdl});

  final int currentUserIdl;

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  late final ChallengeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = di<ChallengeCubit>()..getChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(AppStrings.challenges),
      ),
      body: BlocProvider.value(
        value: _cubit,
        child: BlocBuilder<ChallengeCubit, ChallengeState>(
          // listener: _listener,
          builder: (context, state) {
            return switch (state.getStatus) {
              CubitStatus.initial => const SizedBox.shrink(),
              CubitStatus.loading => const LoadingWidget().center(),
              CubitStatus.failure => ErrorButtonWidget(onTap: _cubit.getChallenges).center(),
              CubitStatus.success => RefreshIndicator(
                  onRefresh: () async => _cubit.getFriends(),
                  child: ListView.separated(
                    itemCount: state.challenges.length,
                    separatorBuilder: (_, __) => const Gap(0),
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: FriendTile(
                          user: widget.currentUserIdl == state.challenges[index].host!.id
                              ? state.challenges[index].guest!
                              : state.challenges[index].host!,
                          // trailingIcon: FontAwesomeIcons.check,
                          // onTailingTapped: (id) {},
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        children: [
                          TextWidget(state.challenges[index].quiz?.name),
                          TextWidget(state.challenges[index].quiz?.description, maxLines: 5),
                          const Gap(8),
                          if (state.challenges[index].isWinner == true)
                            SizedBox(
                              width: context.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(FontAwesomeIcons.trophy, size: 20, color: Colors.green),
                                  const Gap(8),
                                  TextWidget(
                                    AppStrings.winner,
                                    style: context.textTheme.titleMedium?.copyWith(color: Colors.green),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          else if (state.challenges[index].isWinner == false)
                            SizedBox(
                              width: context.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(FontAwesomeIcons.circleExclamation, size: 20, color: Colors.red),
                                  const Gap(8),
                                  TextWidget(
                                    AppStrings.loser,
                                    style: context.textTheme.titleMedium?.copyWith(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          else if (widget.currentUserIdl == state.challenges[index].host!.id)
                            SizedBox(
                              width: context.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(FontAwesomeIcons.clock, size: 20, color: Colors.blue),
                                  const Gap(8),
                                  TextWidget(
                                    AppStrings.waitingForOpponent,
                                    style: context.textTheme.titleMedium?.copyWith(color: Colors.blue),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          else
                            ButtonWidget(
                              width: context.width,
                              foregroundColor: context.colorScheme.onPrimary,
                              backgroundColor: context.colorScheme.primary,
                              text: AppStrings.accept,
                              onPressed: () {
                                context
                                    .pushNamed(
                                      AppRoutes.quizIntro,
                                      extra: QuizIntroPageArguments(
                                        id: state.challenges[index].quiz!.id,
                                        challengeId: state.challenges[index].id,
                                      ),
                                    )
                                    .whenComplete(() => _cubit.getChallenges());
                              },
                            ),
                        ],
                      );
                    },
                  ),
                ),
            };
          },
        ),
      ),
    );
  }

  // _listener(BuildContext context, ChallengeState state) {
  //   if (state.requestStatus == CubitStatus.loading) {
  //     Toaster.showLoading();
  //   } else if (state.requestStatus == CubitStatus.failure) {
  //     Toaster.closeLoading();
  //     Toaster.showError(context: context, message: AppStrings.error);
  //   } else if (state.requestStatus == CubitStatus.success) {
  //     Toaster.closeLoading();
  //     Toaster.showSuccess(context: context, message: AppStrings.success);
  //   }
  // }
}
