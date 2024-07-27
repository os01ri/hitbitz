import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteProfileDataSource {
  const RemoteProfileDataSource();

  Future<BaseResponse<UserProfileModel>> getProfile() async {
    final rowData = await Http.get(uri: EndPoints.getProfile());
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => UserProfileModel.fromJson(body),
    );
  }

  Future<NoResponse> updateProfile({required BodyMap body}) async {
    await Http.post(uri: EndPoints.updateProfile(), body: body);
    return NoResponse();
  }
}
