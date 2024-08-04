import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/challenge/data/models/challenge_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteChallengeDataSource {
  const RemoteChallengeDataSource();

  Future<BaseResponse<List<ChallengeModel>>> getChallenges({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getChallenges(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => challengeModelFromJson(body),
    );
  }

  Future<BaseResponse<ChallengeModel>> inviteToChallenge({required BodyMap body}) async {
    final rowData = await Http.post(uri: EndPoints.inviteToChallenge(), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => ChallengeModel.fromJson(body),
    );
  }
}
