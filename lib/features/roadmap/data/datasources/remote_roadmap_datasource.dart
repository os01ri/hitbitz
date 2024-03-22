import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteRoadMapDataSource {
  const RemoteRoadMapDataSource();

  Future<BaseResponse<List<LevelModel>>> getLevels({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getLevels(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => levelsListFromJson(body),
    );
  }

  Future<BaseResponse<List<StepModel>>> getSteps({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getSteps(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => stepModelFromJson(body),
    );
  }
}
