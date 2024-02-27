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

  Future<BaseResponse<List<CategoryModel>>> getCategories({required BodyMap body}) async {
    final rowData = await Http.get(uri: EndPoints.getCategories(), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => categoryModelFromJson(body),
    );
  }

  Future<BaseResponse<List<RoadMapModel>>> getRoadMaps({required BodyMap body}) async {
    final rowData = await Http.get(uri: EndPoints.getRoadMaps(), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => roadMapModelFromJson(body),
    );
  }
}
