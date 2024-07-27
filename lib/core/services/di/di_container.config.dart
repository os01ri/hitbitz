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
    as _i14;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i13;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i20;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i19;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i49;
import '../../../features/friends/data/datasources/remote_friends_datasource.dart'
    as _i9;
import '../../../features/friends/data/repositories/frinds_repository_impl.dart'
    as _i16;
import '../../../features/friends/domain/repositories/friends_repository.dart'
    as _i15;
import '../../../features/friends/domain/usecases/accept_friend_requests_usecase.dart'
    as _i32;
import '../../../features/friends/domain/usecases/get_friend_requests_usecase.dart'
    as _i27;
import '../../../features/friends/domain/usecases/get_friends_usecase.dart'
    as _i30;
import '../../../features/friends/domain/usecases/get_users_usecase.dart'
    as _i29;
import '../../../features/friends/domain/usecases/send_friend_requests_usecase.dart'
    as _i31;
import '../../../features/friends/domain/usecases/show_user_usecase.dart'
    as _i28;
import '../../../features/friends/presentation/cubit/friends_cubit.dart'
    as _i51;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i8;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i35;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i34;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i47;
import '../../../features/home/domain/usecases/get_home_roadmap_usecase.dart'
    as _i46;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i48;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i50;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i3;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i18;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i17;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i38;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i55;
import '../../../features/notification/data/datasources/notifications_datasource.dart'
    as _i6;
import '../../../features/notification/data/repositories/notifications_repository_impl.dart'
    as _i22;
import '../../../features/notification/domain/repositories/notification_repository.dart'
    as _i21;
import '../../../features/notification/domain/usecases/get_notification_usecase.dart'
    as _i33;
import '../../../features/notification/presentation/cubit/notifications_cubit.dart'
    as _i40;
import '../../../features/profile/data/datasources/remote_profile_datasource.dart'
    as _i5;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i12;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i11;
import '../../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i23;
import '../../../features/profile/domain/usecases/update_profile_usecase.dart'
    as _i24;
import '../../../features/profile/presentation/cubit/profile_cubit.dart'
    as _i39;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i4;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i37;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i36;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i52;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i53;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i54;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i57;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i10;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i26;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i25;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i43;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i44;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i42;
import '../../../features/roadmap/domain/usecases/show_roadmap_usecase.dart'
    as _i41;
import '../../../features/roadmap/domain/usecases/start_roadmap_usecase.dart'
    as _i45;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i56;

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
  gh.lazySingleton<_i11.ProfileRepository>(() => _i12.ProfileRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteProfileDataSource>()));
  gh.lazySingleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
      remoteDataSource: gh<_i7.RemoteAuthDataSource>()));
  gh.lazySingleton<_i15.FriendsRepository>(() => _i16.FriendsRepositoryImpl(
      remoteDataSource: gh<_i9.RemoteFriendsDataSource>()));
  gh.lazySingleton<_i17.MainRepository>(() => _i18.MainRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteMainDataSource>()));
  gh.factory<_i19.SignInUsecase>(
      () => _i19.SignInUsecase(repository: gh<_i13.AuthRepository>()));
  gh.factory<_i20.LoginUsecase>(
      () => _i20.LoginUsecase(repository: gh<_i13.AuthRepository>()));
  gh.lazySingleton<_i21.NotificationsRepository>(() =>
      _i22.NotificationsRepositoryImpl(
          remoteDataSource: gh<_i6.RemoteNotificationsDataSource>()));
  gh.factory<_i23.GetProfileUsecase>(
      () => _i23.GetProfileUsecase(repository: gh<_i11.ProfileRepository>()));
  gh.factory<_i24.UpdateProfileUsecase>(() =>
      _i24.UpdateProfileUsecase(repository: gh<_i11.ProfileRepository>()));
  gh.lazySingleton<_i25.RoadMapRepository>(() => _i26.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i10.RemoteRoadMapDataSource>()));
  gh.factory<_i27.GetFriendRequestsUsecase>(() =>
      _i27.GetFriendRequestsUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i28.ShowUserUsecase>(
      () => _i28.ShowUserUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i29.GetUsersUsecase>(
      () => _i29.GetUsersUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i30.GetFriendsUsecase>(
      () => _i30.GetFriendsUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i31.SendFriendRequestUsecase>(() =>
      _i31.SendFriendRequestUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i32.AcceptFriendRequestUsecase>(() =>
      _i32.AcceptFriendRequestUsecase(
          repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i33.GetNotificationUsecase>(() => _i33.GetNotificationUsecase(
      repository: gh<_i21.NotificationsRepository>()));
  gh.lazySingleton<_i34.HomeRepository>(() => _i35.HomeRepositoryImpl(
      remoteDataSource: gh<_i8.RemoteHomeDataSource>()));
  gh.lazySingleton<_i36.QuizRepository>(() => _i37.QuizRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteQuizDataSource>()));
  gh.factory<_i38.MakeSuggestionUsecase>(
      () => _i38.MakeSuggestionUsecase(repository: gh<_i17.MainRepository>()));
  gh.lazySingleton<_i39.ProfileCubit>(() => _i39.ProfileCubit(
        getProfileUsecase: gh<_i23.GetProfileUsecase>(),
        updateProfileUsecase: gh<_i24.UpdateProfileUsecase>(),
      ));
  gh.lazySingleton<_i40.NotificationsCubit>(() => _i40.NotificationsCubit(
      getNotificationUsecase: gh<_i33.GetNotificationUsecase>()));
  gh.factory<_i41.ShowRoadMapUsecase>(
      () => _i41.ShowRoadMapUsecase(repository: gh<_i25.RoadMapRepository>()));
  gh.factory<_i42.RoadMapToggleBookmarkUsecase>(() =>
      _i42.RoadMapToggleBookmarkUsecase(
          repository: gh<_i25.RoadMapRepository>()));
  gh.factory<_i43.GetSavedRoadmapsUsecase>(() =>
      _i43.GetSavedRoadmapsUsecase(repository: gh<_i25.RoadMapRepository>()));
  gh.factory<_i44.GetStepsUsecase>(
      () => _i44.GetStepsUsecase(repository: gh<_i25.RoadMapRepository>()));
  gh.factory<_i45.StartRoadMapUsecase>(
      () => _i45.StartRoadMapUsecase(repository: gh<_i25.RoadMapRepository>()));
  gh.factory<_i46.GetHomeRoadMapUsecase>(
      () => _i46.GetHomeRoadMapUsecase(repository: gh<_i34.HomeRepository>()));
  gh.factory<_i47.GetCategoriesUsecase>(
      () => _i47.GetCategoriesUsecase(repository: gh<_i34.HomeRepository>()));
  gh.factory<_i48.GetRoadMapsUsecase>(
      () => _i48.GetRoadMapsUsecase(repository: gh<_i34.HomeRepository>()));
  gh.lazySingleton<_i49.AuthCubit>(() => _i49.AuthCubit(
        loginUsecase: gh<_i20.LoginUsecase>(),
        signInUsecase: gh<_i19.SignInUsecase>(),
      ));
  gh.factory<_i50.HomeCubit>(() => _i50.HomeCubit(
        getCategoriesUsecase: gh<_i47.GetCategoriesUsecase>(),
        getHomeRoadMapUsecase: gh<_i46.GetHomeRoadMapUsecase>(),
      ));
  gh.factory<_i51.FriendsCubit>(() => _i51.FriendsCubit(
        getUsersUsecase: gh<_i29.GetUsersUsecase>(),
        showUserUsecase: gh<_i28.ShowUserUsecase>(),
        getFriendsUsecase: gh<_i30.GetFriendsUsecase>(),
        getFriendRequestUsecase: gh<_i27.GetFriendRequestsUsecase>(),
        sendFriendRequestUsecase: gh<_i31.SendFriendRequestUsecase>(),
        acceptFriendRequestUsecase: gh<_i32.AcceptFriendRequestUsecase>(),
      ));
  gh.factory<_i52.CompleteQuizUsecase>(
      () => _i52.CompleteQuizUsecase(repository: gh<_i36.QuizRepository>()));
  gh.factory<_i53.GetQuizzesUsecase>(
      () => _i53.GetQuizzesUsecase(repository: gh<_i36.QuizRepository>()));
  gh.factory<_i54.ShowQuizUsecase>(
      () => _i54.ShowQuizUsecase(repository: gh<_i36.QuizRepository>()));
  gh.lazySingleton<_i55.MainCubit>(() =>
      _i55.MainCubit(makeSuggestionUsecase: gh<_i38.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i56.RoadmapCubit>(() => _i56.RoadmapCubit(
        showRoadMapUsecase: gh<_i41.ShowRoadMapUsecase>(),
        startRoadMapUsecase: gh<_i45.StartRoadMapUsecase>(),
        getStepsUsecase: gh<_i44.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i42.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i43.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i48.GetRoadMapsUsecase>(),
      ));
  gh.lazySingleton<_i57.QuizCubit>(() => _i57.QuizCubit(
        getQuizzesUsecase: gh<_i53.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i54.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i52.CompleteQuizUsecase>(),
      ));
  return getIt;
}
