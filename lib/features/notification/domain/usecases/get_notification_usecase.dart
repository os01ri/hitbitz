import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/notification/data/models/notification_model.dart';
import 'package:hitbitz/features/notification/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNotificationUsecase implements UseCase<List<NotificationModel>, NoParams> {
  final NotificationsRepository repository;

  const GetNotificationUsecase({required this.repository});

  @override
  Future<Either<Failure, List<NotificationModel>>> call(NoParams params) async {
    return repository.getNotifications(params: params.getParams());
  }
}
