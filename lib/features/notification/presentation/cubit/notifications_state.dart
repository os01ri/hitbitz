part of 'notifications_cubit.dart';

class NotificationsState {
  final CubitStatus status;
  final List<NotificationModel> notifications;
  final Failure? failure;

  const NotificationsState({
    this.status = CubitStatus.initial,
    this.notifications = const [],
    this.failure,
  });

  NotificationsState copyWith({
    CubitStatus? status,
    List<NotificationModel>? notifications,
    Failure? failure,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      failure: failure ?? this.failure,
    );
  }
}
