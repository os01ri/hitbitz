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
    as _i5;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i10;
import '../../../features/auth/domain/repositories/auth_repository.dart' as _i9;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i14;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i13;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i32;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i8;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i21;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i20;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i30;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i31;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i33;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i6;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i12;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i11;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i24;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i38;
import '../../../features/notification/data/datasources/notifications_datasource.dart'
    as _i3;
import '../../../features/notification/data/repositories/notifications_repository_impl.dart'
    as _i16;
import '../../../features/notification/domain/repositories/notification_repository.dart'
    as _i15;
import '../../../features/notification/domain/usecases/get_notification_usecase.dart'
    as _i19;
import '../../../features/notification/presentation/cubit/notifications_cubit.dart'
    as _i25;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i4;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i23;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i22;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i34;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i36;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i35;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i39;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i7;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i18;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i17;
import '../../../features/roadmap/domain/usecases/get_levels_usecase.dart'
    as _i27;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i26;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i29;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i28;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i37;

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
  gh.factory<_i3.RemoteNotificationsDataSource>(
      () => const _i3.RemoteNotificationsDataSource());
  gh.factory<_i4.RemoteQuizDataSource>(() => const _i4.RemoteQuizDataSource());
  gh.factory<_i5.RemoteAuthDataSource>(() => const _i5.RemoteAuthDataSource());
  gh.factory<_i6.RemoteMainDataSource>(() => const _i6.RemoteMainDataSource());
  gh.factory<_i7.RemoteRoadMapDataSource>(
      () => const _i7.RemoteRoadMapDataSource());
  gh.factory<_i8.RemoteHomeDataSource>(() => const _i8.RemoteHomeDataSource());
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteAuthDataSource>()));
  gh.lazySingleton<_i11.MainRepository>(() => _i12.MainRepositoryImpl(
      remoteDataSource: gh<_i6.RemoteMainDataSource>()));
  gh.factory<_i13.SignInUsecase>(
      () => _i13.SignInUsecase(repository: gh<_i9.AuthRepository>()));
  gh.factory<_i14.LoginUsecase>(
      () => _i14.LoginUsecase(repository: gh<_i9.AuthRepository>()));
  gh.lazySingleton<_i15.NotificationsRepository>(() =>
      _i16.NotificationsRepositoryImpl(
          remoteDataSource: gh<_i3.RemoteNotificationsDataSource>()));
  gh.lazySingleton<_i17.RoadMapRepository>(() => _i18.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i7.RemoteRoadMapDataSource>()));
  gh.factory<_i19.GetNotificationUsecase>(() => _i19.GetNotificationUsecase(
      repository: gh<_i15.NotificationsRepository>()));
  gh.lazySingleton<_i20.HomeRepository>(() => _i21.HomeRepositoryImpl(
      remoteDataSource: gh<_i8.RemoteHomeDataSource>()));
  gh.lazySingleton<_i22.QuizRepository>(() => _i23.QuizRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteQuizDataSource>()));
  gh.factory<_i24.MakeSuggestionUsecase>(
      () => _i24.MakeSuggestionUsecase(repository: gh<_i11.MainRepository>()));
  gh.lazySingleton<_i25.NotificationsCubit>(() => _i25.NotificationsCubit(
      getNotificationUsecase: gh<_i19.GetNotificationUsecase>()));
  gh.factory<_i26.GetSavedRoadmapsUsecase>(() =>
      _i26.GetSavedRoadmapsUsecase(repository: gh<_i17.RoadMapRepository>()));
  gh.factory<_i27.GetLevelsUsecase>(
      () => _i27.GetLevelsUsecase(repository: gh<_i17.RoadMapRepository>()));
  gh.factory<_i28.RoadMapToggleBookmarkUsecase>(() =>
      _i28.RoadMapToggleBookmarkUsecase(
          repository: gh<_i17.RoadMapRepository>()));
  gh.factory<_i29.GetStepsUsecase>(
      () => _i29.GetStepsUsecase(repository: gh<_i17.RoadMapRepository>()));
  gh.factory<_i30.GetCategoriesUsecase>(
      () => _i30.GetCategoriesUsecase(repository: gh<_i20.HomeRepository>()));
  gh.factory<_i31.GetRoadMapsUsecase>(
      () => _i31.GetRoadMapsUsecase(repository: gh<_i20.HomeRepository>()));
  gh.lazySingleton<_i32.AuthCubit>(() => _i32.AuthCubit(
        loginUsecase: gh<_i14.LoginUsecase>(),
        signInUsecase: gh<_i13.SignInUsecase>(),
      ));
  gh.factory<_i33.HomeCubit>(() =>
      _i33.HomeCubit(getCategoriesUsecase: gh<_i30.GetCategoriesUsecase>()));
  gh.factory<_i34.CompleteQuizUsecase>(
      () => _i34.CompleteQuizUsecase(repository: gh<_i22.QuizRepository>()));
  gh.factory<_i35.ShowQuizUsecase>(
      () => _i35.ShowQuizUsecase(repository: gh<_i22.QuizRepository>()));
  gh.factory<_i36.GetQuizzesUsecase>(
      () => _i36.GetQuizzesUsecase(repository: gh<_i22.QuizRepository>()));
  gh.lazySingleton<_i37.RoadmapCubit>(() => _i37.RoadmapCubit(
        getLevelsUsecase: gh<_i27.GetLevelsUsecase>(),
        getStepsUsecase: gh<_i29.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i28.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i26.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i31.GetRoadMapsUsecase>(),
      ));
  gh.lazySingleton<_i38.MainCubit>(() =>
      _i38.MainCubit(makeSuggestionUsecase: gh<_i24.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i39.QuizCubit>(() => _i39.QuizCubit(
        getQuizzesUsecase: gh<_i36.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i35.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i34.CompleteQuizUsecase>(),
      ));
  return getIt;
}
