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
    as _i3;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i17;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i16;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i22;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i23;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i54;
import '../../../features/cv/data/datasources/cv_datasource.dart' as _i4;
import '../../../features/cv/data/repositories/cv_repo_impl.dart' as _i15;
import '../../../features/cv/domain/repositories/cv_repo.dart' as _i14;
import '../../../features/cv/domain/usecases/get_categories_usecase.dart'
    as _i41;
import '../../../features/cv/domain/usecases/get_roadmaps_usecase.dart' as _i42;
import '../../../features/cv/domain/usecases/send_cv_usecase.dart' as _i43;
import '../../../features/cv/presentation/bloc/cv_bloc.dart' as _i61;
import '../../../features/friends/data/datasources/remote_friends_datasource.dart'
    as _i5;
import '../../../features/friends/data/repositories/frinds_repository_impl.dart'
    as _i19;
import '../../../features/friends/domain/repositories/friends_repository.dart'
    as _i18;
import '../../../features/friends/domain/usecases/accept_friend_requests_usecase.dart'
    as _i29;
import '../../../features/friends/domain/usecases/get_friend_requests_usecase.dart'
    as _i31;
import '../../../features/friends/domain/usecases/get_friends_usecase.dart'
    as _i30;
import '../../../features/friends/domain/usecases/get_users_usecase.dart'
    as _i32;
import '../../../features/friends/domain/usecases/send_friend_requests_usecase.dart'
    as _i33;
import '../../../features/friends/domain/usecases/show_user_usecase.dart'
    as _i34;
import '../../../features/friends/presentation/cubit/friends_cubit.dart'
    as _i56;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i6;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i37;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i36;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i51;
import '../../../features/home/domain/usecases/get_home_roadmap_usecase.dart'
    as _i52;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i53;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i55;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i7;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i21;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i20;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i40;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i60;
import '../../../features/notification/data/datasources/notifications_datasource.dart'
    as _i8;
import '../../../features/notification/data/repositories/notifications_repository_impl.dart'
    as _i25;
import '../../../features/notification/domain/repositories/notification_repository.dart'
    as _i24;
import '../../../features/notification/domain/usecases/get_notification_usecase.dart'
    as _i35;
import '../../../features/notification/presentation/cubit/notifications_cubit.dart'
    as _i44;
import '../../../features/profile/data/datasources/remote_profile_datasource.dart'
    as _i9;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i13;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i12;
import '../../../features/profile/domain/usecases/get_profile_usecase.dart'
    as _i26;
import '../../../features/profile/presentation/cubit/profile_cubit.dart'
    as _i50;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i10;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i39;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i38;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i57;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i58;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i59;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i63;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i11;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i28;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i27;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i45;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i46;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i47;
import '../../../features/roadmap/domain/usecases/show_roadmap_usecase.dart'
    as _i48;
import '../../../features/roadmap/domain/usecases/start_roadmap_usecase.dart'
    as _i49;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i62;

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
  gh.factory<_i3.RemoteAuthDataSource>(() => const _i3.RemoteAuthDataSource());
  gh.factory<_i4.RemoteCvDatasource>(() => _i4.RemoteCvDatasource());
  gh.factory<_i5.RemoteFriendsDataSource>(
      () => const _i5.RemoteFriendsDataSource());
  gh.factory<_i6.RemoteHomeDataSource>(() => const _i6.RemoteHomeDataSource());
  gh.factory<_i7.RemoteMainDataSource>(() => const _i7.RemoteMainDataSource());
  gh.factory<_i8.RemoteNotificationsDataSource>(
      () => const _i8.RemoteNotificationsDataSource());
  gh.factory<_i9.RemoteProfileDataSource>(
      () => const _i9.RemoteProfileDataSource());
  gh.factory<_i10.RemoteQuizDataSource>(
      () => const _i10.RemoteQuizDataSource());
  gh.factory<_i11.RemoteRoadMapDataSource>(
      () => const _i11.RemoteRoadMapDataSource());
  gh.lazySingleton<_i12.ProfileRepository>(() => _i13.ProfileRepositoryImpl(
      remoteDataSource: gh<_i9.RemoteProfileDataSource>()));
  gh.factory<_i14.CvRepo>(
      () => _i15.CvRepoImpl(datasource: gh<_i4.RemoteCvDatasource>()));
  gh.lazySingleton<_i16.AuthRepository>(() => _i17.AuthRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteAuthDataSource>()));
  gh.lazySingleton<_i18.FriendsRepository>(() => _i19.FriendsRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteFriendsDataSource>()));
  gh.lazySingleton<_i20.MainRepository>(() => _i21.MainRepositoryImpl(
      remoteDataSource: gh<_i7.RemoteMainDataSource>()));
  gh.factory<_i22.LoginUsecase>(
      () => _i22.LoginUsecase(repository: gh<_i16.AuthRepository>()));
  gh.factory<_i23.SignInUsecase>(
      () => _i23.SignInUsecase(repository: gh<_i16.AuthRepository>()));
  gh.lazySingleton<_i24.NotificationsRepository>(() =>
      _i25.NotificationsRepositoryImpl(
          remoteDataSource: gh<_i8.RemoteNotificationsDataSource>()));
  gh.factory<_i26.GetProfileUsecase>(
      () => _i26.GetProfileUsecase(repository: gh<_i12.ProfileRepository>()));
  gh.lazySingleton<_i27.RoadMapRepository>(() => _i28.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i11.RemoteRoadMapDataSource>()));
  gh.factory<_i29.AcceptFriendRequestUsecase>(() =>
      _i29.AcceptFriendRequestUsecase(
          repository: gh<_i18.FriendsRepository>()));
  gh.factory<_i30.GetFriendsUsecase>(
      () => _i30.GetFriendsUsecase(repository: gh<_i18.FriendsRepository>()));
  gh.factory<_i31.GetFriendRequestsUsecase>(() =>
      _i31.GetFriendRequestsUsecase(repository: gh<_i18.FriendsRepository>()));
  gh.factory<_i32.GetUsersUsecase>(
      () => _i32.GetUsersUsecase(repository: gh<_i18.FriendsRepository>()));
  gh.factory<_i33.SendFriendRequestUsecase>(() =>
      _i33.SendFriendRequestUsecase(repository: gh<_i18.FriendsRepository>()));
  gh.factory<_i34.ShowUserUsecase>(
      () => _i34.ShowUserUsecase(repository: gh<_i18.FriendsRepository>()));
  gh.factory<_i35.GetNotificationUsecase>(() => _i35.GetNotificationUsecase(
      repository: gh<_i24.NotificationsRepository>()));
  gh.lazySingleton<_i36.HomeRepository>(() => _i37.HomeRepositoryImpl(
      remoteDataSource: gh<_i6.RemoteHomeDataSource>()));
  gh.lazySingleton<_i38.QuizRepository>(() => _i39.QuizRepositoryImpl(
      remoteDataSource: gh<_i10.RemoteQuizDataSource>()));
  gh.factory<_i40.MakeSuggestionUsecase>(
      () => _i40.MakeSuggestionUsecase(repository: gh<_i20.MainRepository>()));
  gh.factory<_i41.GetCategoriesForCvUsecase>(
      () => _i41.GetCategoriesForCvUsecase(repo: gh<_i14.CvRepo>()));
  gh.factory<_i42.GetRoadmapsForCvUsecase>(
      () => _i42.GetRoadmapsForCvUsecase(repo: gh<_i14.CvRepo>()));
  gh.factory<_i43.SendCvUsecase>(
      () => _i43.SendCvUsecase(repo: gh<_i14.CvRepo>()));
  gh.lazySingleton<_i44.NotificationsCubit>(() => _i44.NotificationsCubit(
      getNotificationUsecase: gh<_i35.GetNotificationUsecase>()));
  gh.factory<_i45.GetSavedRoadmapsUsecase>(() =>
      _i45.GetSavedRoadmapsUsecase(repository: gh<_i27.RoadMapRepository>()));
  gh.factory<_i46.GetStepsUsecase>(
      () => _i46.GetStepsUsecase(repository: gh<_i27.RoadMapRepository>()));
  gh.factory<_i47.RoadMapToggleBookmarkUsecase>(() =>
      _i47.RoadMapToggleBookmarkUsecase(
          repository: gh<_i27.RoadMapRepository>()));
  gh.factory<_i48.ShowRoadMapUsecase>(
      () => _i48.ShowRoadMapUsecase(repository: gh<_i27.RoadMapRepository>()));
  gh.factory<_i49.StartRoadMapUsecase>(
      () => _i49.StartRoadMapUsecase(repository: gh<_i27.RoadMapRepository>()));
  gh.lazySingleton<_i50.ProfileCubit>(
      () => _i50.ProfileCubit(getProfileUsecase: gh<_i26.GetProfileUsecase>()));
  gh.factory<_i51.GetCategoriesUsecase>(
      () => _i51.GetCategoriesUsecase(repository: gh<_i36.HomeRepository>()));
  gh.factory<_i52.GetHomeRoadMapUsecase>(
      () => _i52.GetHomeRoadMapUsecase(repository: gh<_i36.HomeRepository>()));
  gh.factory<_i53.GetRoadMapsUsecase>(
      () => _i53.GetRoadMapsUsecase(repository: gh<_i36.HomeRepository>()));
  gh.lazySingleton<_i54.AuthCubit>(() => _i54.AuthCubit(
        loginUsecase: gh<_i22.LoginUsecase>(),
        signInUsecase: gh<_i23.SignInUsecase>(),
      ));
  gh.factory<_i55.HomeCubit>(() => _i55.HomeCubit(
        getCategoriesUsecase: gh<_i51.GetCategoriesUsecase>(),
        getHomeRoadMapUsecase: gh<_i52.GetHomeRoadMapUsecase>(),
      ));
  gh.factory<_i56.FriendsCubit>(() => _i56.FriendsCubit(
        getUsersUsecase: gh<_i32.GetUsersUsecase>(),
        showUserUsecase: gh<_i34.ShowUserUsecase>(),
        getFriendsUsecase: gh<_i30.GetFriendsUsecase>(),
        getFriendRequestUsecase: gh<_i31.GetFriendRequestsUsecase>(),
        sendFriendRequestUsecase: gh<_i33.SendFriendRequestUsecase>(),
        acceptFriendRequestUsecase: gh<_i29.AcceptFriendRequestUsecase>(),
      ));
  gh.factory<_i57.CompleteQuizUsecase>(
      () => _i57.CompleteQuizUsecase(repository: gh<_i38.QuizRepository>()));
  gh.factory<_i58.GetQuizzesUsecase>(
      () => _i58.GetQuizzesUsecase(repository: gh<_i38.QuizRepository>()));
  gh.factory<_i59.ShowQuizUsecase>(
      () => _i59.ShowQuizUsecase(repository: gh<_i38.QuizRepository>()));
  gh.lazySingleton<_i60.MainCubit>(() =>
      _i60.MainCubit(makeSuggestionUsecase: gh<_i40.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i61.CvBloc>(() => _i61.CvBloc(
        gh<_i42.GetRoadmapsForCvUsecase>(),
        gh<_i41.GetCategoriesForCvUsecase>(),
        gh<_i43.SendCvUsecase>(),
      ));
  gh.lazySingleton<_i62.RoadmapCubit>(() => _i62.RoadmapCubit(
        showRoadMapUsecase: gh<_i48.ShowRoadMapUsecase>(),
        startRoadMapUsecase: gh<_i49.StartRoadMapUsecase>(),
        getStepsUsecase: gh<_i46.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i47.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i45.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i53.GetRoadMapsUsecase>(),
      ));
  gh.lazySingleton<_i63.QuizCubit>(() => _i63.QuizCubit(
        getQuizzesUsecase: gh<_i58.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i59.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i57.CompleteQuizUsecase>(),
      ));
  return getIt;
}
