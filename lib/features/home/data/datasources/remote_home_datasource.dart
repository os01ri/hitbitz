import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteHomeDataSource {
  const RemoteHomeDataSource();

  Future<BaseResponse<List<CategoryModel>>> getCategories({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getCategories(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => categoriesListFromJson(body),
    );
  }

  Future<BaseResponse<List<RoadMapModel>>> getRoadMaps({required ParamsMap params, required BodyMap body}) async {
    final rowData = await Http.get(uri: EndPoints.getRoadMaps(params: params), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => roadMapsListFromJson(body),
    );
  }
}
