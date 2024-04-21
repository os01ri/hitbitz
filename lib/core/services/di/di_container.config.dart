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
    as _i11;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i10;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i17;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i21;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i22;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i4;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i16;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i15;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i23;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i25;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i26;
import '../../../features/quiz/data/datasources/remote_quiz_datasource.dart'
    as _i5;
import '../../../features/quiz/data/repositories/roadmap_repository_impl.dart'
    as _i19;
import '../../../features/quiz/domain/repositories/quiz_repository.dart'
    as _i18;
import '../../../features/quiz/domain/usecases/get_quizzes_usecase.dart'
    as _i24;
import '../../../features/quiz/domain/usecases/show_quiz_usecase.dart' as _i20;
import '../../../features/quiz/presentation/cubit/quiz_cubit.dart' as _i27;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i6;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i8;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i7;
import '../../../features/roadmap/domain/usecases/get_levels_usecase.dart'
    as _i12;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i13;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i14;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i9;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i28;

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
  gh.factory<_i4.RemoteHomeDataSource>(() => const _i4.RemoteHomeDataSource());
  gh.factory<_i5.RemoteQuizDataSource>(() => const _i5.RemoteQuizDataSource());
  gh.factory<_i6.RemoteRoadMapDataSource>(
      () => const _i6.RemoteRoadMapDataSource());
  gh.lazySingleton<_i7.RoadMapRepository>(() => _i8.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i6.RemoteRoadMapDataSource>()));
  gh.factory<_i9.RoadMapToggleBookmarkUsecase>(() =>
      _i9.RoadMapToggleBookmarkUsecase(
          repository: gh<_i7.RoadMapRepository>()));
  gh.lazySingleton<_i10.AuthRepository>(() => _i11.AuthRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteAuthDataSource>()));
  gh.factory<_i12.GetLevelsUsecase>(
      () => _i12.GetLevelsUsecase(repository: gh<_i7.RoadMapRepository>()));
  gh.factory<_i13.GetSavedRoadmapsUsecase>(() =>
      _i13.GetSavedRoadmapsUsecase(repository: gh<_i7.RoadMapRepository>()));
  gh.factory<_i14.GetStepsUsecase>(
      () => _i14.GetStepsUsecase(repository: gh<_i7.RoadMapRepository>()));
  gh.lazySingleton<_i15.HomeRepository>(() => _i16.HomeRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteHomeDataSource>()));
  gh.factory<_i17.LoginUsecase>(
      () => _i17.LoginUsecase(repository: gh<_i10.AuthRepository>()));
  gh.lazySingleton<_i18.QuizRepository>(() => _i19.QuizRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteQuizDataSource>()));
  gh.factory<_i20.ShowQuizUsecase>(
      () => _i20.ShowQuizUsecase(repository: gh<_i18.QuizRepository>()));
  gh.factory<_i21.SignInUsecase>(
      () => _i21.SignInUsecase(repository: gh<_i10.AuthRepository>()));
  gh.lazySingleton<_i22.AuthCubit>(() => _i22.AuthCubit(
        loginUsecase: gh<_i17.LoginUsecase>(),
        signInUsecase: gh<_i21.SignInUsecase>(),
      ));
  gh.factory<_i23.GetCategoriesUsecase>(
      () => _i23.GetCategoriesUsecase(repository: gh<_i15.HomeRepository>()));
  gh.factory<_i24.GetQuizzesUsecase>(
      () => _i24.GetQuizzesUsecase(repository: gh<_i18.QuizRepository>()));
  gh.factory<_i25.GetRoadMapsUsecase>(
      () => _i25.GetRoadMapsUsecase(repository: gh<_i15.HomeRepository>()));
  gh.factory<_i26.HomeCubit>(() =>
      _i26.HomeCubit(getCategoriesUsecase: gh<_i23.GetCategoriesUsecase>()));
  gh.lazySingleton<_i27.QuizCubit>(() => _i27.QuizCubit(
        getQuizzesUsecase: gh<_i24.GetQuizzesUsecase>(),
        showQuizUsecase: gh<_i20.ShowQuizUsecase>(),
      ));
  gh.lazySingleton<_i28.RoadmapCubit>(() => _i28.RoadmapCubit(
        getLevelsUsecase: gh<_i12.GetLevelsUsecase>(),
        getStepsUsecase: gh<_i14.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i9.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i13.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i25.GetRoadMapsUsecase>(),
      ));
  return getIt;
}
