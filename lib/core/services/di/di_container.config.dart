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
    as _i10;
import '../../../features/auth/domain/repositories/auth_repository.dart' as _i9;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i16;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i17;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i18;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i4;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i15;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i14;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i19;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i20;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i21;
import '../../../features/roadmap/data/datasources/remote_roadmap_datasource.dart'
    as _i5;
import '../../../features/roadmap/data/repositories/roadmap_repository_impl.dart'
    as _i7;
import '../../../features/roadmap/domain/repositories/roadmap_repository.dart'
    as _i6;
import '../../../features/roadmap/domain/usecases/get_levels_usecase.dart'
    as _i11;
import '../../../features/roadmap/domain/usecases/get_saved_roadmaps_usecase.dart'
    as _i12;
import '../../../features/roadmap/domain/usecases/get_steps_usecase.dart'
    as _i13;
import '../../../features/roadmap/domain/usecases/roadmap_toggle_bookmark_usecase.dart'
    as _i8;
import '../../../features/roadmap/presentation/cubit/roadmap_cubit.dart'
    as _i22;

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
  gh.factory<_i5.RemoteRoadMapDataSource>(
      () => const _i5.RemoteRoadMapDataSource());
  gh.lazySingleton<_i6.RoadMapRepository>(() => _i7.RoadMapRepositoryImpl(
      remoteDataSource: gh<_i5.RemoteRoadMapDataSource>()));
  gh.factory<_i8.RoadMapToggleBookmarkUsecase>(() =>
      _i8.RoadMapToggleBookmarkUsecase(
          repository: gh<_i6.RoadMapRepository>()));
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
      remoteDataSource: gh<_i3.RemoteAuthDataSource>()));
  gh.factory<_i11.GetLevelsUsecase>(
      () => _i11.GetLevelsUsecase(repository: gh<_i6.RoadMapRepository>()));
  gh.factory<_i12.GetSavedRoadmapsUsecase>(() =>
      _i12.GetSavedRoadmapsUsecase(repository: gh<_i6.RoadMapRepository>()));
  gh.factory<_i13.GetStepsUsecase>(
      () => _i13.GetStepsUsecase(repository: gh<_i6.RoadMapRepository>()));
  gh.lazySingleton<_i14.HomeRepository>(() => _i15.HomeRepositoryImpl(
      remoteDataSource: gh<_i4.RemoteHomeDataSource>()));
  gh.factory<_i16.LoginUsecase>(
      () => _i16.LoginUsecase(repository: gh<_i9.AuthRepository>()));
  gh.factory<_i17.SignInUsecase>(
      () => _i17.SignInUsecase(repository: gh<_i9.AuthRepository>()));
  gh.lazySingleton<_i18.AuthCubit>(() => _i18.AuthCubit(
        loginUsecase: gh<_i16.LoginUsecase>(),
        signInUsecase: gh<_i17.SignInUsecase>(),
      ));
  gh.factory<_i19.GetCategoriesUsecase>(
      () => _i19.GetCategoriesUsecase(repository: gh<_i14.HomeRepository>()));
  gh.factory<_i20.GetRoadMapsUsecase>(
      () => _i20.GetRoadMapsUsecase(repository: gh<_i14.HomeRepository>()));
  gh.factory<_i21.HomeCubit>(() =>
      _i21.HomeCubit(getCategoriesUsecase: gh<_i19.GetCategoriesUsecase>()));
  gh.lazySingleton<_i22.RoadmapCubit>(() => _i22.RoadmapCubit(
        getLevelsUsecase: gh<_i11.GetLevelsUsecase>(),
        getStepsUsecase: gh<_i13.GetStepsUsecase>(),
        roadMapToggleBookmarkUsecase: gh<_i8.RoadMapToggleBookmarkUsecase>(),
        getSavedRoadmapsUsecase: gh<_i12.GetSavedRoadmapsUsecase>(),
        getRoadMapsUsecase: gh<_i20.GetRoadMapsUsecase>(),
      ));
  return getIt;
}
