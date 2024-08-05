import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/challenge/data/models/challenge_model.dart';
import 'package:hitbitz/features/challenge/domain/usecases/get_challenges_usecase.dart';
import 'package:hitbitz/features/challenge/domain/usecases/invite_to_challenge_usecase.dart';
import 'package:hitbitz/features/friends/domain/usecases/get_friends_usecase.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

part 'challenge_state.dart';

@lazySingleton
class ChallengeCubit extends Cubit<ChallengeState> {
  final GetChallengesUsecase _getChallengesUsecase;
  final InviteToChallengeUsecase _inviteToChallengeUsecase;
  final GetFriendsUsecase _getFriendsUsecase;

  ChallengeCubit({
    required GetChallengesUsecase getChallengesUsecase,
    required InviteToChallengeUsecase inviteToChallengeUsecase,
    required GetFriendsUsecase getFriendsUsecase,
  })  : _getChallengesUsecase = getChallengesUsecase,
        _inviteToChallengeUsecase = inviteToChallengeUsecase,
        _getFriendsUsecase = getFriendsUsecase,
        super(const ChallengeState());

  getFriends() async {
    emit(state.copyWith(getFriendsStatus: CubitStatus.loading, inviteStatus: CubitStatus.initial));

    final result = await _getFriendsUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getFriendsStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(getFriendsStatus: CubitStatus.success, friends: r)),
    );

    // emit(state.copyWith(getFriendsStatus: CubitStatus.initial));
  }

  getChallenges() async {
    emit(state.copyWith(getStatus: CubitStatus.loading));

    final result = await _getChallengesUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(getStatus: CubitStatus.success, challenges: r)),
    );
  }

  inviteToChallenge(InviteToChallengeParams params) async {
    emit(state.copyWith(inviteStatus: CubitStatus.loading));

    final result = await _inviteToChallengeUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(inviteStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(inviteStatus: CubitStatus.success, challenge: r)),
    );

    emit(state.copyWith(inviteStatus: CubitStatus.initial));
  }
}
