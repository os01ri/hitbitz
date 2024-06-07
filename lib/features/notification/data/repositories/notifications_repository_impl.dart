import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/notification/data/datasources/notifications_datasource.dart';
import 'package:hitbitz/features/notification/data/models/notification_model.dart';
import 'package:hitbitz/features/notification/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl with RepositoryExceptionHandler implements NotificationsRepository {
  final RemoteNotificationsDataSource remoteDataSource;

  const NotificationsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications({required ParamsMap params}) {
    return exceptionHandler<List<NotificationModel>>(tryCall: () async {
      final result = await remoteDataSource.getNotifications(params: params);
      return Right(result.data);
    });
  }
}
