import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
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

  Future<BaseResponse<List<UserModel>>> getFriends({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.friends(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => usersListFromJson(body),
    );
  }

  Future<BaseResponse<List<UserModel>>> getFriendRequests({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.friendRequests(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => usersListFromJson(body),
    );
  }

  Future<NoResponse> acceptFriendRequest({required BodyMap body}) async {
    await Http.postFormData(uri: EndPoints.acceptRequest(), body: body);
    return NoResponse();
  }

  Future<NoResponse> sendFriendRequest({required BodyMap body}) async {
    await Http.postFormData(uri: EndPoints.friendRequests(), body: body);
    return NoResponse();
  }
}
