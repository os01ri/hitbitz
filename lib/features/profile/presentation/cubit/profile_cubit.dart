import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:hitbitz/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUsecase _getProfileUsecase;

  ProfileCubit({
    required GetProfileUsecase getProfileUsecase,
  })  : _getProfileUsecase = getProfileUsecase,
        super(const ProfileState());

  getProfile() async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await _getProfileUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(status: CubitStatus.success)),
      (r) => emit(state.copyWith(status: CubitStatus.failure, profile: r)),
    );
  }
}
