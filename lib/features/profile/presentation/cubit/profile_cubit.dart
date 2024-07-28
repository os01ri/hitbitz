import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/services/shared_preferences_service.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:hitbitz/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:hitbitz/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUsecase _getProfileUsecase;
  final UpdateProfileUsecase _updateProfileUsecase;

  ProfileCubit({
    required GetProfileUsecase getProfileUsecase,
    required UpdateProfileUsecase updateProfileUsecase,
  })  : _getProfileUsecase = getProfileUsecase,
        _updateProfileUsecase = updateProfileUsecase,
        super(const ProfileState());

  getProfile() async {
    emit(state.copyWith(getStatus: CubitStatus.loading));

    final result = await _getProfileUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(getStatus: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(getStatus: CubitStatus.success, profile: r)),
    );

    emit(state.copyWith(updateStatus: CubitStatus.initial));
  }

  updateProfile(UpdateProfileParams params) async {
    emit(state.copyWith(updateStatus: CubitStatus.loading));

    final result = await _updateProfileUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(updateStatus: CubitStatus.failure, failure: l)),
      (r) {
        if (params.fullName != null) SharedPreferencesService.setFullName(params.fullName!);
        emit(state.copyWith(updateStatus: CubitStatus.success));
      },
    );

    emit(state.copyWith(updateStatus: CubitStatus.initial));
  }
}
