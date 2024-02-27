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
    as _i6;
import '../../../features/auth/domain/repositories/auth_repository.dart' as _i5;
import '../../../features/auth/domain/usecases/login_usecase.dart' as _i9;
import '../../../features/auth/domain/usecases/sign_in_usecase.dart' as _i10;
import '../../../features/auth/presentation/cubit/auth_cubit.dart' as _i11;
import '../../../features/home/data/datasources/remote_home_datasource.dart'
    as _i4;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i8;
import '../../../features/home/domain/repositories/home_repository.dart' as _i7;
import '../../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i12;
import '../../../features/home/domain/usecases/get_roadmaps_usecase.dart'
    as _i13;
import '../../../features/home/presentation/cubit/home_cubit.dart' as _i14;

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
  gh.lazySingleton<_i5.AuthRepository>(() =>
      _i6.AuthRepositoryImpl(remoteDataSource: gh<_i3.RemoteAuthDataSource>()));
  gh.lazySingleton<_i7.HomeRepository>(() =>
      _i8.HomeRepositoryImpl(remoteDataSource: gh<_i4.RemoteHomeDataSource>()));
  gh.factory<_i9.LoginUsecase>(
      () => _i9.LoginUsecase(repository: gh<_i5.AuthRepository>()));
  gh.factory<_i10.SignInUsecase>(
      () => _i10.SignInUsecase(repository: gh<_i5.AuthRepository>()));
  gh.lazySingleton<_i11.AuthCubit>(() => _i11.AuthCubit(
        loginUsecase: gh<_i9.LoginUsecase>(),
        signInUsecase: gh<_i10.SignInUsecase>(),
      ));
  gh.factory<_i12.GetCategoriesUsecase>(
      () => _i12.GetCategoriesUsecase(repository: gh<_i7.HomeRepository>()));
  gh.factory<_i13.GetRoadMapsUsecase>(
      () => _i13.GetRoadMapsUsecase(repository: gh<_i7.HomeRepository>()));
  gh.lazySingleton<_i14.HomeCubit>(() => _i14.HomeCubit(
        getCategoriesUsecase: gh<_i12.GetCategoriesUsecase>(),
        getRoadMapsUsecase: gh<_i13.GetRoadMapsUsecase>(),
      ));
  return getIt;
}
