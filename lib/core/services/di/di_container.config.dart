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
    as _i4;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i9;
import '../../../features/auth/domain/repositories/auth_repository.dart' as _i8;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i13;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i12;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i27;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i7;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i17;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i16;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i25;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i26;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i28;
import '../../../features/main/data/datasources/remote_main_datasource.dart'
    as _i5;
import '../../../features/main/data/repositories/main_repository_impl.dart'
    as _i11;
import '../../../features/main/domain/repositories/main_repository.dart'
    as _i10;
import '../../../features/main/domain/usecases/make_suggestion_usecase.dart'
    as _i20;
import '../../../features/main/presentation/cubit/main_cubit/main_cubit.dart'
    as _i33;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i3;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i19;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i18;
import '../../../features/quiz/domain/usecases/complete_quiz_usecase.dart'
    as _i29;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i31;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i30;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i34;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i6;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i15;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i14;
import '../../../features/roadmap/domain/usecases/get_levels_usecase.dart'
    as _i22;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i21;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i24;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i23;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i32;

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
  gh.factory<_i3.RemoteQuizDataSource>(() => const _i3.RemoteQuizDataSource());
  gh.factory<_i4.RemoteAuthDataSource>(() => const _i4.RemoteAuthDataSource());
  gh.factory<_i5.RemoteMainDataSource>(() => const _i5.RemoteMainDataSource());
  gh.factory<_i6.RemoteRoadMapDataSource>(
      () => const _i6.RemoteRoadMapDataSource());
  gh.factory<_i7.RemoteHomeDataSource>(() => const _i7.RemoteHomeDataSource());
  gh.lazySingleton<_i8.AuthRepository>(() =>
      _i9.AuthRepositoryImpl(remoteDataSource: gh<_i4.RemoteAuthDataSource>()));
  gh.lazySingleton<_i10.MainRepository>(() => _i11.MainRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteMainDataSource>()));
  gh.factory<_i12.SignInUsecase>(
      () => _i12.SignInUsecase(repository: gh<_i8.AuthRepository>()));
  gh.factory<_i13.LoginUsecase>(
      () => _i13.LoginUsecase(repository: gh<_i8.AuthRepository>()));
  gh.lazySingleton<_i14.RoadMapRepository>(() => _i15.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i6.RemoteRoadMapDataSource>()));
  gh.lazySingleton<_i16.HomeRepository>(() => _i17.HomeRepositoryImpl(
      remoteDataSource: gh<_i7.RemoteHomeDataSource>()));
  gh.lazySingleton<_i18.QuizRepository>(() => _i19.QuizRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteQuizDataSource>()));
  gh.factory<_i20.MakeSuggestionUsecase>(
      () => _i20.MakeSuggestionUsecase(repository: gh<_i10.MainRepository>()));
  gh.factory<_i21.GetSavedRoadmapsUsecase>(() =>
      _i21.GetSavedRoadmapsUsecase(repository: gh<_i14.RoadMapRepository>()));
  gh.factory<_i22.GetLevelsUsecase>(
      () => _i22.GetLevelsUsecase(repository: gh<_i14.RoadMapRepository>()));
  gh.factory<_i23.RoadMapToggleBookmarkUsecase>(() =>
      _i23.RoadMapToggleBookmarkUsecase(
          repository: gh<_i14.RoadMapRepository>()));
  gh.factory<_i24.GetStepsUsecase>(
      () => _i24.GetStepsUsecase(repository: gh<_i14.RoadMapRepository>()));
  gh.factory<_i25.GetCategoriesUsecase>(
      () => _i25.GetCategoriesUsecase(repository: gh<_i16.HomeRepository>()));
  gh.factory<_i26.GetRoadMapsUsecase>(
      () => _i26.GetRoadMapsUsecase(repository: gh<_i16.HomeRepository>()));
  gh.lazySingleton<_i27.AuthCubit>(() => _i27.AuthCubit(
        loginUsecase: gh<_i13.LoginUsecase>(),
        signInUsecase: gh<_i12.SignInUsecase>(),
      ));
  gh.factory<_i28.HomeCubit>(() =>
      _i28.HomeCubit(getCategoriesUsecase: gh<_i25.GetCategoriesUsecase>()));
  gh.factory<_i29.CompleteQuizUsecase>(
      () => _i29.CompleteQuizUsecase(repository: gh<_i18.QuizRepository>()));
  gh.factory<_i30.ShowQuizUsecase>(
      () => _i30.ShowQuizUsecase(repository: gh<_i18.QuizRepository>()));
  gh.factory<_i31.GetQuizzesUsecase>(
      () => _i31.GetQuizzesUsecase(repository: gh<_i18.QuizRepository>()));
  gh.lazySingleton<_i32.RoadmapCubit>(() => _i32.RoadmapCubit(
        getLevelsUsecase: gh<_i22.GetLevelsUsecase>(),
        getStepsUsecase: gh<_i24.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i23.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i21.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i26.GetRoadMapsUsecase>(),
      ));
  gh.lazySingleton<_i33.MainCubit>(() =>
      _i33.MainCubit(makeSuggestionUsecase: gh<_i20.MakeSuggestionUsecase>()));
  gh.lazySingleton<_i34.QuizCubit>(() => _i34.QuizCubit(
        getQuizzesUsecase: gh<_i31.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i30.ShowQuizUsecase>(),
        completeQuizUsecase: gh<_i29.CompleteQuizUsecase>(),
      ));
  return getIt;
}
