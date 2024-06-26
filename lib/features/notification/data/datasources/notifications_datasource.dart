import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/notification/data/models/notification_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteNotificationsDataSource {
  const RemoteNotificationsDataSource();

  Future<BaseResponse<List<NotificationModel>>> getNotifications({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getNotifications(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => notificationModelFromJson(body),
    );
  }
}
