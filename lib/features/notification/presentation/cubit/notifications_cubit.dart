import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitbitz/core/config/cubit_status.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/notification/data/models/notification_model.dart';
import 'package:hitbitz/features/notification/domain/usecases/get_notification_usecase.dart';
import 'package:injectable/injectable.dart';

part 'notifications_state.dart';

@lazySingleton
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationUsecase _getNotificationUsecase;

  NotificationsCubit({
    required GetNotificationUsecase getNotificationUsecase,
  })  : _getNotificationUsecase = getNotificationUsecase,
        super(const NotificationsState());

  getNotifications() async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await _getNotificationUsecase(NoParams());

    result.fold(
      (l) => emit(state.copyWith(status: CubitStatus.failure, failure: l)),
      (r) => emit(state.copyWith(status: CubitStatus.success, notifications: r)),
    );
  }
}
