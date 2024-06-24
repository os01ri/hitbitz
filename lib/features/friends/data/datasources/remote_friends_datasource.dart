import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/friends/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteFriendsDataSource {
  const RemoteFriendsDataSource();

  Future<BaseResponse<List<UserModel>>> getUsers({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getUsers(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => usersListFromJson(body),
    );
  }

  Future<BaseResponse<UserModel>> showUser({required int id, required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.showUser(id: id, params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => UserModel.fromJson(body),
    );
  }
}
