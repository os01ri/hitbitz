import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/features/quiz/data/models/question_model.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';
import 'package:injectable/injectable.dart';

import '../models/certif_model.dart';

@injectable
class RemoteRoadMapDataSource {
  const RemoteRoadMapDataSource();

  Future<BaseResponse<RoadMapModel>> showRoadMap(
      {required int id, required ParamsMap params}) async {
    final rowData =
        await Http.get(uri: EndPoints.showRoadMap(id: id, params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => RoadMapModel.fromJson(body),
    );
  }

  Future<BaseResponse<RoadMapModel>> startRoadMap(
      {required int id, required ParamsMap params}) async {
    final rowData =
        await Http.get(uri: EndPoints.startRoadMap(id: id, params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => RoadMapModel.fromJson(body),
    );
  }

  Future<BaseResponse<List<StepModel>>> getSteps(
      {required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getSteps(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => stepModelFromJson(body),
    );
  }

  Future<NoResponse> roadMapToggleBookmark({required int id}) async {
    await Http.get(uri: EndPoints.roadMapToggleBookmark(id: id));
    return NoResponse();
  }

  Future<BaseResponse<List<RoadMapModel>>> getSavedRoadmaps(
      {required ParamsMap params}) async {
    final rowData =
        await Http.get(uri: EndPoints.getSavedRoadmaps(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => roadMapsListFromJson(body),
    );
  }

  Future<BaseResponse<List<QuestionModel>>> createCustomQuiz(
      {required ParamsMap params}) async {
    final rowData =
        await Http.get(uri: EndPoints.createCustomQuiz(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => questionsListFromJson(body),
    );
  }

  Future<RedeemCertificateModel> redeemCertificate(
      {required ParamsMap params}) async {
    final rowData = await Http.get(
      uri: EndPoints.redeemCertificate(params: params),
    );
    return redeemCertificateModelFromJson(rowData);
  }
}
