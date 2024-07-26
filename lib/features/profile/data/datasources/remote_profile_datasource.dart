import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/profile/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteProfileDataSource {
  const RemoteProfileDataSource();

  Future<BaseResponse<UserProfileModel>> getProfile() async {
    final rowData = await Http.get(uri: EndPoints.profile());
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => UserProfileModel.fromJson(body),
    );
  }
}
