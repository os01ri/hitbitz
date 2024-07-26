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
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i48;
import '../../../features/friends/data/datasources/remote_friends_datasource.dart'
    as _i9;
import '../../../features/friends/data/repositories/frinds_repository_impl.dart'
    as _i16;
import '../../../features/friends/domain/repositories/friends_repository.dart'
    as _i15;
import '../../../features/friends/domain/usecases/accept_friend_requests_usecase.dart'
    as _i31;
import '../../../features/friends/domain/usecases/get_friend_requests_usecase.dart'
    as _i26;
import '../../../features/friends/domain/usecases/get_friends_usecase.dart'
    as _i29;
import '../../../features/friends/domain/usecases/get_users_usecase.dart'
    as _i28;
import '../../../features/friends/domain/usecases/send_friend_requests_usecase.dart'
    as _i30;
import '../../../features/friends/domain/usecases/show_user_usecase.dart'
    as _i27;
import '../../../features/friends/presentation/cubit/friends_cubit.dart'
    as _i50;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i8;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i34;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i33;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i46;
import '../../../features/home/domain/usecases/get_home_roadmap_usecase.dart'
    as _i45;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i47;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i49;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i3;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i18;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i17;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i37;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i54;
import '../../../features/notification/data/datasources/notifications_datasource.dart'
    as _i6;
import '../../../features/notification/data/repositories/notifications_repository_impl.dart'
    as _i22;
import '../../../features/notification/domain/repositories/notification_repository.dart'
    as _i21;
import '../../../features/notification/domain/usecases/get_notification_usecase.dart'
    as _i32;
import '../../../features/notification/presentation/cubit/notifications_cubit.dart'
    as _i38;
import '../../../features/profile/data/datasources/remote_profile_datasource.dart'
    as _i5;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i12;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i11;
import '../../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i23;
import '../../../features/profile/presentation/cubit/profile_cubit.dart'
    as _i44;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i4;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i36;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i35;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i51;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i52;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i53;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i56;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i10;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i25;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i24;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i41;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i42;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i40;
import '../../../features/roadmap/domain/usecases/show_roadmap_usecase.dart'
    as _i39;
import '../../../features/roadmap/domain/usecases/start_roadmap_usecase.dart'
    as _i43;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i55;

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
  gh.lazySingleton<_i24.RoadMapRepository>(() => _i25.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i10.RemoteRoadMapDataSource>()));
  gh.factory<_i26.GetFriendRequestsUsecase>(() =>
      _i26.GetFriendRequestsUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i27.ShowUserUsecase>(
      () => _i27.ShowUserUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i28.GetUsersUsecase>(
      () => _i28.GetUsersUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i29.GetFriendsUsecase>(
      () => _i29.GetFriendsUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i30.SendFriendRequestUsecase>(() =>
      _i30.SendFriendRequestUsecase(repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i31.AcceptFriendRequestUsecase>(() =>
      _i31.AcceptFriendRequestUsecase(
          repository: gh<_i15.FriendsRepository>()));
  gh.factory<_i32.GetNotificationUsecase>(() => _i32.GetNotificationUsecase(
      repository: gh<_i21.NotificationsRepository>()));
  gh.lazySingleton<_i33.HomeRepository>(() => _i34.HomeRepositoryImpl(
      remoteDataSource: gh<_i8.RemoteHomeDataSource>()));
  gh.lazySingleton<_i35.QuizRepository>(() => _i36.QuizRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteQuizDataSource>()));
  gh.factory<_i37.MakeSuggestionUsecase>(
      () => _i37.MakeSuggestionUsecase(repository: gh<_i17.MainRepository>()));
  gh.lazySingleton<_i38.NotificationsCubit>(() => _i38.NotificationsCubit(
      getNotificationUsecase: gh<_i32.GetNotificationUsecase>()));
  gh.factory<_i39.ShowRoadMapUsecase>(
      () => _i39.ShowRoadMapUsecase(repository: gh<_i24.RoadMapRepository>()));
  gh.factory<_i40.RoadMapToggleBookmarkUsecase>(() =>
      _i40.RoadMapToggleBookmarkUsecase(
          repository: gh<_i24.RoadMapRepository>()));
  gh.factory<_i41.GetSavedRoadmapsUsecase>(() =>
      _i41.GetSavedRoadmapsUsecase(repository: gh<_i24.RoadMapRepository>()));
  gh.factory<_i42.GetStepsUsecase>(
      () => _i42.GetStepsUsecase(repository: gh<_i24.RoadMapRepository>()));
  gh.factory<_i43.StartRoadMapUsecase>(
      () => _i43.StartRoadMapUsecase(repository: gh<_i24.RoadMapRepository>()));
  gh.lazySingleton<_i44.ProfileCubit>(
      () => _i44.ProfileCubit(getProfileUsecase: gh<_i23.GetProfileUsecase>()));
  gh.factory<_i45.GetHomeRoadMapUsecase>(
      () => _i45.GetHomeRoadMapUsecase(repository: gh<_i33.HomeRepository>()));
  gh.factory<_i46.GetCategoriesUsecase>(
      () => _i46.GetCategoriesUsecase(repository: gh<_i33.HomeRepository>()));
  gh.factory<_i47.GetRoadMapsUsecase>(
      () => _i47.GetRoadMapsUsecase(repository: gh<_i33.HomeRepository>()));
  gh.lazySingleton<_i48.AuthCubit>(() => _i48.AuthCubit(
        loginUsecase: gh<_i20.LoginUsecase>(),
        signInUsecase: gh<_i19.SignInUsecase>(),
      ));
  gh.factory<_i49.HomeCubit>(() => _i49.HomeCubit(
        getCategoriesUsecase: gh<_i46.GetCategoriesUsecase>(),
        getHomeRoadMapUsecase: gh<_i45.GetHomeRoadMapUsecase>(),
      ));
  gh.factory<_i50.FriendsCubit>(() => _i50.FriendsCubit(
        getUsersUsecase: gh<_i28.GetUsersUsecase>(),
        showUserUsecase: gh<_i27.ShowUserUsecase>(),
        getFriendsUsecase: gh<_i29.GetFriendsUsecase>(),
        getFriendRequestUsecase: gh<_i26.GetFriendRequestsUsecase>(),
        sendFriendRequestUsecase: gh<_i30.SendFriendRequestUsecase>(),
        acceptFriendRequestUsecase: gh<_i31.AcceptFriendRequestUsecase>(),
      ));
  gh.factory<_i51.CompleteQuizUsecase>(
      () => _i51.CompleteQuizUsecase(repository: gh<_i35.QuizRepository>()));
  gh.factory<_i52.GetQuizzesUsecase>(
      () => _i52.GetQuizzesUsecase(repository: gh<_i35.QuizRepository>()));
  gh.factory<_i53.ShowQuizUsecase>(
      () => _i53.ShowQuizUsecase(repository: gh<_i35.QuizRepository>()));
  gh.lazySingleton<_i54.MainCubit>(() =>
      _i54.MainCubit(makeSuggestionUsecase: gh<_i37.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i55.RoadmapCubit>(() => _i55.RoadmapCubit(
        showRoadMapUsecase: gh<_i39.ShowRoadMapUsecase>(),
        startRoadMapUsecase: gh<_i43.StartRoadMapUsecase>(),
        getStepsUsecase: gh<_i42.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i40.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i41.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i47.GetRoadMapsUsecase>(),
      ));
  gh.lazySingleton<_i56.QuizCubit>(() => _i56.QuizCubit(
        getQuizzesUsecase: gh<_i52.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i53.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i51.CompleteQuizUsecase>(),
      ));
  return getIt;
}
