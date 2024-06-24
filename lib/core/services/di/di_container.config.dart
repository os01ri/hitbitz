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
    as _i6;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i11;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i10;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i17;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i16;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i38;
import '../../../features/friends/data/datasources/remote_friends_datasource.dart'
    as _i9;
import '../../../features/friends/data/repositories/frinds_repository_impl.dart'
    as _i13;
import '../../../features/friends/domain/repositories/friends_repository.dart'
    as _i12;
import '../../../features/friends/domain/usecases/get_users_usecase.dart'
    as _i22;
import '../../../features/friends/presentation/cubit/friends_cubit.dart'
    as _i24;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i7;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i26;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i25;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i36;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i37;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i39;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i3;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i15;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i14;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i29;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i43;
import '../../../features/notification/data/datasources/notifications_datasource.dart'
    as _i5;
import '../../../features/notification/data/repositories/notifications_repository_impl.dart'
    as _i19;
import '../../../features/notification/domain/repositories/notification_repository.dart'
    as _i18;
import '../../../features/notification/domain/usecases/get_notification_usecase.dart'
    as _i23;
import '../../../features/notification/presentation/cubit/notifications_cubit.dart'
    as _i30;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i4;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i28;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i27;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i40;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i41;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i42;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i45;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i8;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i21;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i20;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i33;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i34;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i32;
import '../../../features/roadmap/domain/usecases/show_roadmap_usecase.dart'
    as _i31;
import '../../../features/roadmap/domain/usecases/start_roadmap_usecase.dart'
    as _i35;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i44;

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
  gh.factory<_i5.RemoteNotificationsDataSource>(
      () => const _i5.RemoteNotificationsDataSource());
  gh.factory<_i6.RemoteAuthDataSource>(() => const _i6.RemoteAuthDataSource());
  gh.factory<_i7.RemoteHomeDataSource>(() => const _i7.RemoteHomeDataSource());
  gh.factory<_i8.RemoteRoadMapDataSource>(
      () => const _i8.RemoteRoadMapDataSource());
  gh.factory<_i9.RemoteFriendsDataSource>(
      () => const _i9.RemoteFriendsDataSource());
  gh.lazySingleton<_i10.AuthRepository>(() => _i11.AuthRepositoryImpl(
      remoteDataSource: gh<_i6.RemoteAuthDataSource>()));
  gh.lazySingleton<_i12.FriendsRepository>(() => _i13.FriendsRepositoryImpl(
      remoteDataSource: gh<_i9.RemoteFriendsDataSource>()));
  gh.lazySingleton<_i14.MainRepository>(() => _i15.MainRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteMainDataSource>()));
  gh.factory<_i16.SignInUsecase>(
      () => _i16.SignInUsecase(repository: gh<_i10.AuthRepository>()));
  gh.factory<_i17.LoginUsecase>(
      () => _i17.LoginUsecase(repository: gh<_i10.AuthRepository>()));
  gh.lazySingleton<_i18.NotificationsRepository>(() =>
      _i19.NotificationsRepositoryImpl(
          remoteDataSource: gh<_i5.RemoteNotificationsDataSource>()));
  gh.lazySingleton<_i20.RoadMapRepository>(() => _i21.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i8.RemoteRoadMapDataSource>()));
  gh.factory<_i22.GetUsersUsecase>(
      () => _i22.GetUsersUsecase(repository: gh<_i12.FriendsRepository>()));
  gh.factory<_i23.GetNotificationUsecase>(() => _i23.GetNotificationUsecase(
      repository: gh<_i18.NotificationsRepository>()));
  gh.lazySingleton<_i24.FriendsCubit>(
      () => _i24.FriendsCubit(getUsersUsecase: gh<_i22.GetUsersUsecase>()));
  gh.lazySingleton<_i25.HomeRepository>(() => _i26.HomeRepositoryImpl(
      remoteDataSource: gh<_i7.RemoteHomeDataSource>()));
  gh.lazySingleton<_i27.QuizRepository>(() => _i28.QuizRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteQuizDataSource>()));
  gh.factory<_i29.MakeSuggestionUsecase>(
      () => _i29.MakeSuggestionUsecase(repository: gh<_i14.MainRepository>()));
  gh.lazySingleton<_i30.NotificationsCubit>(() => _i30.NotificationsCubit(
      getNotificationUsecase: gh<_i23.GetNotificationUsecase>()));
  gh.factory<_i31.ShowRoadMapUsecase>(
      () => _i31.ShowRoadMapUsecase(repository: gh<_i20.RoadMapRepository>()));
  gh.factory<_i32.RoadMapToggleBookmarkUsecase>(() =>
      _i32.RoadMapToggleBookmarkUsecase(
          repository: gh<_i20.RoadMapRepository>()));
  gh.factory<_i33.GetSavedRoadmapsUsecase>(() =>
      _i33.GetSavedRoadmapsUsecase(repository: gh<_i20.RoadMapRepository>()));
  gh.factory<_i34.GetStepsUsecase>(
      () => _i34.GetStepsUsecase(repository: gh<_i20.RoadMapRepository>()));
  gh.factory<_i35.StartRoadMapUsecase>(
      () => _i35.StartRoadMapUsecase(repository: gh<_i20.RoadMapRepository>()));
  gh.factory<_i36.GetCategoriesUsecase>(
      () => _i36.GetCategoriesUsecase(repository: gh<_i25.HomeRepository>()));
  gh.factory<_i37.GetRoadMapsUsecase>(
      () => _i37.GetRoadMapsUsecase(repository: gh<_i25.HomeRepository>()));
  gh.lazySingleton<_i38.AuthCubit>(() => _i38.AuthCubit(
        loginUsecase: gh<_i17.LoginUsecase>(),
        signInUsecase: gh<_i16.SignInUsecase>(),
      ));
  gh.factory<_i39.HomeCubit>(() =>
      _i39.HomeCubit(getCategoriesUsecase: gh<_i36.GetCategoriesUsecase>()));
  gh.factory<_i40.CompleteQuizUsecase>(
      () => _i40.CompleteQuizUsecase(repository: gh<_i27.QuizRepository>()));
  gh.factory<_i41.GetQuizzesUsecase>(
      () => _i41.GetQuizzesUsecase(repository: gh<_i27.QuizRepository>()));
  gh.factory<_i42.ShowQuizUsecase>(
      () => _i42.ShowQuizUsecase(repository: gh<_i27.QuizRepository>()));
  gh.lazySingleton<_i43.MainCubit>(() =>
      _i43.MainCubit(makeSuggestionUsecase: gh<_i29.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i44.RoadmapCubit>(() => _i44.RoadmapCubit(
        showRoadMapUsecase: gh<_i31.ShowRoadMapUsecase>(),
        startRoadMapUsecase: gh<_i35.StartRoadMapUsecase>(),
        getStepsUsecase: gh<_i34.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i32.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i33.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i37.GetRoadMapsUsecase>(),
      ));
  gh.lazySingleton<_i45.QuizCubit>(() => _i45.QuizCubit(
        getQuizzesUsecase: gh<_i41.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i42.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i40.CompleteQuizUsecase>(),
      ));
  return getIt;
}
