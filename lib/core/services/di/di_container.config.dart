// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/auth/data/datasources/remote_auth_datasource.dart'
    as _i7;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i20;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i19;
import '../../../features/auth/domain/usecases/forget_password_usecase.dart'
    as _i27;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i26;
import '../../../features/auth/domain/usecases/reset_password_usecase.dart'
    as _i28;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i25;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i50;
import '../../../features/challenge/data/datasources/remote_challenge_datasource.dart'
    as _i12;
import '../../../features/challenge/data/repositories/challenge_repository_impl.dart'
    as _i18;
import '../../../features/challenge/domain/repositories/challenge_repository.dart'
    as _i17;
import '../../../features/challenge/domain/usecases/get_challenges_usecase.dart'
    as _i47;
import '../../../features/challenge/domain/usecases/invite_to_challenge_usecase.dart'
    as _i46;
import '../../../features/challenge/presentation/cubit/challenge_cubit.dart'
    as _i66;
import '../../../features/cv/data/datasources/cv_datasource.dart' as _i11;
import '../../../features/cv/data/repositories/cv_repo_impl.dart' as _i16;
import '../../../features/cv/domain/repositories/cv_repo.dart' as _i15;
import '../../../features/cv/domain/usecases/get_categories_usecase.dart'
    as _i51;
import '../../../features/cv/domain/usecases/get_roadmaps_usecase.dart' as _i53;
import '../../../features/cv/domain/usecases/send_cv_usecase.dart' as _i52;
import '../../../features/cv/presentation/bloc/cv_bloc.dart' as _i75;
import '../../../features/friends/data/datasources/remote_friends_datasource.dart'
    as _i9;
import '../../../features/friends/data/repositories/frinds_repository_impl.dart'
    as _i22;
import '../../../features/friends/domain/repositories/friends_repository.dart'
    as _i21;
import '../../../features/friends/domain/usecases/accept_friend_requests_usecase.dart'
    as _i40;
import '../../../features/friends/domain/usecases/get_friend_requests_usecase.dart'
    as _i35;
import '../../../features/friends/domain/usecases/get_friends_usecase.dart'
    as _i38;
import '../../../features/friends/domain/usecases/get_users_usecase.dart'
    as _i37;
import '../../../features/friends/domain/usecases/send_friend_requests_usecase.dart'
    as _i39;
import '../../../features/friends/domain/usecases/show_user_usecase.dart'
    as _i36;
import '../../../features/friends/presentation/cubit/friends_cubit.dart'
    as _i67;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i8;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i43;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i42;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i63;
import '../../../features/home/domain/usecases/get_home_roadmap_usecase.dart'
    as _i62;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i64;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i65;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i3;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i24;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i23;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i48;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i73;
import '../../../features/notification/data/datasources/notifications_datasource.dart'
    as _i6;
import '../../../features/notification/data/repositories/notifications_repository_impl.dart'
    as _i30;
import '../../../features/notification/domain/repositories/notification_repository.dart'
    as _i29;
import '../../../features/notification/domain/usecases/get_notification_usecase.dart'
    as _i41;
import '../../../features/notification/presentation/cubit/notifications_cubit.dart'
    as _i54;
import '../../../features/profile/data/datasources/remote_profile_datasource.dart'
    as _i5;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i14;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i13;
import '../../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i31;
import '../../../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i32;
import '../../../features/profile/presentation/cubit/profile_cubit.dart'
    as _i49;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i4;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i45;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i44;
import '../../../features/quiz/domain/usecases/complete_custom_quiz_usecase.dart'
    as _i71;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i68;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i69;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i70;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i72;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i10;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i34;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i33;
import '../../../features/roadmap/domain/usecases/create_custome_quiz_usecase.dart'
    as _i60;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i57;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i58;
import '../../../features/roadmap/domain/usecases/redeem_certificate_usecase.dart'
    as _i61;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i56;
import '../../../features/roadmap/domain/usecases/show_roadmap_usecase.dart'
    as _i55;
import '../../../features/roadmap/domain/usecases/start_roadmap_usecase.dart'
    as _i59;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i74;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.RemoteMainDataSource>(() => const _i3.RemoteMainDataSource());
  gh.factory<_i4.RemoteQuizDataSource>(() => const _i4.RemoteQuizDataSource());
  gh.factory<_i5.RemoteProfileDataSource>(
      () => const _i5.RemoteProfileDataSource());
  gh.factory<_i6.RemoteNotificationsDataSource>(
      () => const _i6.RemoteNotificationsDataSource());
  gh.factory<_i7.RemoteAuthDataSource>(() => const _i7.RemoteAuthDataSource());
  gh.factory<_i8.RemoteHomeDataSource>(() => const _i8.RemoteHomeDataSource());
  gh.factory<_i9.RemoteFriendsDataSource>(
      () => const _i9.RemoteFriendsDataSource());
  gh.factory<_i10.RemoteRoadMapDataSource>(
      () => const _i10.RemoteRoadMapDataSource());
  gh.factory<_i11.RemoteCvDatasource>(() => _i11.RemoteCvDatasource());
  gh.factory<_i12.RemoteChallengeDataSource>(
      () => const _i12.RemoteChallengeDataSource());
  gh.lazySingleton<_i13.ProfileRepository>(() => _i14.ProfileRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteProfileDataSource>()));
  gh.factory<_i15.CvRepo>(
      () => _i16.CvRepoImpl(datasource: gh<_i11.RemoteCvDatasource>()));
  gh.lazySingleton<_i17.ChallengeRepository>(() => _i18.ChallengeRepositoryImpl(
      remoteDataSource: gh<_i12.RemoteChallengeDataSource>()));
  gh.lazySingleton<_i19.AuthRepository>(() => _i20.AuthRepositoryImpl(
      remoteDataSource: gh<_i7.RemoteAuthDataSource>()));
  gh.lazySingleton<_i21.FriendsRepository>(() => _i22.FriendsRepositoryImpl(
      remoteDataSource: gh<_i9.RemoteFriendsDataSource>()));
  gh.lazySingleton<_i23.MainRepository>(() => _i24.MainRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteMainDataSource>()));
  gh.factory<_i25.SignInUsecase>(
      () => _i25.SignInUsecase(repository: gh<_i19.AuthRepository>()));
  gh.factory<_i26.LoginUsecase>(
      () => _i26.LoginUsecase(repository: gh<_i19.AuthRepository>()));
  gh.factory<_i27.ForgetPasswordUsecase>(
      () => _i27.ForgetPasswordUsecase(repository: gh<_i19.AuthRepository>()));
  gh.factory<_i28.ResetPasswordUsecase>(
      () => _i28.ResetPasswordUsecase(repository: gh<_i19.AuthRepository>()));
  gh.lazySingleton<_i29.NotificationsRepository>(() =>
      _i30.NotificationsRepositoryImpl(
          remoteDataSource: gh<_i6.RemoteNotificationsDataSource>()));
  gh.factory<_i31.GetProfileUsecase>(
      () => _i31.GetProfileUsecase(repository: gh<_i13.ProfileRepository>()));
  gh.factory<_i32.UpdateProfileUsecase>(() =>
      _i32.UpdateProfileUsecase(repository: gh<_i13.ProfileRepository>()));
  gh.lazySingleton<_i33.RoadMapRepository>(() => _i34.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i10.RemoteRoadMapDataSource>()));
  gh.factory<_i35.GetFriendRequestsUsecase>(() =>
      _i35.GetFriendRequestsUsecase(repository: gh<_i21.FriendsRepository>()));
  gh.factory<_i36.ShowUserUsecase>(
      () => _i36.ShowUserUsecase(repository: gh<_i21.FriendsRepository>()));
  gh.factory<_i37.GetUsersUsecase>(
      () => _i37.GetUsersUsecase(repository: gh<_i21.FriendsRepository>()));
  gh.factory<_i38.GetFriendsUsecase>(
      () => _i38.GetFriendsUsecase(repository: gh<_i21.FriendsRepository>()));
  gh.factory<_i39.SendFriendRequestUsecase>(() =>
      _i39.SendFriendRequestUsecase(repository: gh<_i21.FriendsRepository>()));
  gh.factory<_i40.AcceptFriendRequestUsecase>(() =>
      _i40.AcceptFriendRequestUsecase(
          repository: gh<_i21.FriendsRepository>()));
  gh.factory<_i41.GetNotificationUsecase>(() => _i41.GetNotificationUsecase(
      repository: gh<_i29.NotificationsRepository>()));
  gh.lazySingleton<_i42.HomeRepository>(() => _i43.HomeRepositoryImpl(
      remoteDataSource: gh<_i8.RemoteHomeDataSource>()));
  gh.lazySingleton<_i44.QuizRepository>(() => _i45.QuizRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteQuizDataSource>()));
  gh.factory<_i46.InviteToChallengeUsecase>(() => _i46.InviteToChallengeUsecase(
      repository: gh<_i17.ChallengeRepository>()));
  gh.factory<_i47.GetChallengesUsecase>(() =>
      _i47.GetChallengesUsecase(repository: gh<_i17.ChallengeRepository>()));
  gh.factory<_i48.MakeSuggestionUsecase>(
      () => _i48.MakeSuggestionUsecase(repository: gh<_i23.MainRepository>()));
  gh.lazySingleton<_i49.ProfileCubit>(() => _i49.ProfileCubit(
        getProfileUsecase: gh<_i31.GetProfileUsecase>(),
        updateProfileUsecase: gh<_i32.UpdateProfileUsecase>(),
      ));
  gh.lazySingleton<_i50.AuthCubit>(() => _i50.AuthCubit(
        loginUsecase: gh<_i26.LoginUsecase>(),
        signInUsecase: gh<_i25.SignInUsecase>(),
        forgetPasswordUsecase: gh<_i27.ForgetPasswordUsecase>(),
        resetPasswordUsecase: gh<_i28.ResetPasswordUsecase>(),
      ));
  gh.factory<_i51.GetCategoriesForCvUsecase>(
      () => _i51.GetCategoriesForCvUsecase(repo: gh<_i15.CvRepo>()));
  gh.factory<_i52.SendCvUsecase>(
      () => _i52.SendCvUsecase(repo: gh<_i15.CvRepo>()));
  gh.factory<_i53.GetRoadmapsForCvUsecase>(
      () => _i53.GetRoadmapsForCvUsecase(repo: gh<_i15.CvRepo>()));
  gh.lazySingleton<_i54.NotificationsCubit>(() => _i54.NotificationsCubit(
      getNotificationUsecase: gh<_i41.GetNotificationUsecase>()));
  gh.factory<_i55.ShowRoadMapUsecase>(
      () => _i55.ShowRoadMapUsecase(repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i56.RoadMapToggleBookmarkUsecase>(() =>
      _i56.RoadMapToggleBookmarkUsecase(
          repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i57.GetSavedRoadmapsUsecase>(() =>
      _i57.GetSavedRoadmapsUsecase(repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i58.GetStepsUsecase>(
      () => _i58.GetStepsUsecase(repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i59.StartRoadMapUsecase>(
      () => _i59.StartRoadMapUsecase(repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i60.CreateCustomQuizUsecase>(() =>
      _i60.CreateCustomQuizUsecase(repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i61.RedeemCertificateUsecase>(() =>
      _i61.RedeemCertificateUsecase(repository: gh<_i33.RoadMapRepository>()));
  gh.factory<_i62.GetHomeRoadMapUsecase>(
      () => _i62.GetHomeRoadMapUsecase(repository: gh<_i42.HomeRepository>()));
  gh.factory<_i63.GetCategoriesUsecase>(
      () => _i63.GetCategoriesUsecase(repository: gh<_i42.HomeRepository>()));
  gh.factory<_i64.GetRoadMapsUsecase>(
      () => _i64.GetRoadMapsUsecase(repository: gh<_i42.HomeRepository>()));
  gh.factory<_i65.HomeCubit>(() => _i65.HomeCubit(
        getCategoriesUsecase: gh<_i63.GetCategoriesUsecase>(),
        getHomeRoadMapUsecase: gh<_i62.GetHomeRoadMapUsecase>(),
      ));
  gh.lazySingleton<_i66.ChallengeCubit>(() => _i66.ChallengeCubit(
        getChallengesUsecase: gh<_i47.GetChallengesUsecase>(),
        inviteToChallengeUsecase: gh<_i46.InviteToChallengeUsecase>(),
        getFriendsUsecase: gh<_i38.GetFriendsUsecase>(),
      ));
  gh.factory<_i67.FriendsCubit>(() => _i67.FriendsCubit(
        getUsersUsecase: gh<_i37.GetUsersUsecase>(),
        showUserUsecase: gh<_i36.ShowUserUsecase>(),
        getFriendsUsecase: gh<_i38.GetFriendsUsecase>(),
        getFriendRequestUsecase: gh<_i35.GetFriendRequestsUsecase>(),
        sendFriendRequestUsecase: gh<_i39.SendFriendRequestUsecase>(),
        acceptFriendRequestUsecase: gh<_i40.AcceptFriendRequestUsecase>(),
      ));
  gh.factory<_i68.CompleteQuizUsecase>(
      () => _i68.CompleteQuizUsecase(repository: gh<_i44.QuizRepository>()));
  gh.factory<_i69.GetQuizzesUsecase>(
      () => _i69.GetQuizzesUsecase(repository: gh<_i44.QuizRepository>()));
  gh.factory<_i70.ShowQuizUsecase>(
      () => _i70.ShowQuizUsecase(repository: gh<_i44.QuizRepository>()));
  gh.factory<_i71.CompleteCustomQuizUsecase>(() =>
      _i71.CompleteCustomQuizUsecase(repository: gh<_i44.QuizRepository>()));
  gh.lazySingleton<_i72.QuizCubit>(() => _i72.QuizCubit(
        getQuizzesUsecase: gh<_i69.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i70.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i68.CompleteQuizUsecase>(),
        completeCustomQuizUsecase: gh<_i71.CompleteCustomQuizUsecase>(),
      ));
  gh.lazySingleton<_i73.MainCubit>(() =>
      _i73.MainCubit(makeSuggestionUsecase: gh<_i48.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i74.RoadmapCubit>(() => _i74.RoadmapCubit(
        showRoadMapUsecase: gh<_i55.ShowRoadMapUsecase>(),
        startRoadMapUsecase: gh<_i59.StartRoadMapUsecase>(),
        getStepsUsecase: gh<_i58.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i56.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i57.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i64.GetRoadMapsUsecase>(),
        createCustomQuizUsecase: gh<_i60.CreateCustomQuizUsecase>(),
        redeemCertificateUsecase: gh<_i61.RedeemCertificateUsecase>(),
      ));
  gh.lazySingleton<_i75.CvBloc>(() => _i75.CvBloc(
        gh<_i53.GetRoadmapsForCvUsecase>(),
        gh<_i51.GetCategoriesForCvUsecase>(),
        gh<_i52.SendCvUsecase>(),
      ));
  return getIt;
}
