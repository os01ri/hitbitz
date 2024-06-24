import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/auth/data/models/user_data_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteAuthDataSource {
  const RemoteAuthDataSource();

  Future<BaseResponse<UserDataModel>> signIn({required BodyMap body}) async {
    final rowData = await Http.post(uri: EndPoints.signUp(), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => UserDataModel.fromJson(body),
    );
  }

  Future<BaseResponse<UserDataModel>> logIn({required BodyMap body}) async {
    final rowData = await Http.post(uri: EndPoints.logIn(), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => UserDataModel.fromJson(body),
    );
  }
}
