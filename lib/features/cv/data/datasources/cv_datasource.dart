import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/models/base_response.dart';

@injectable
class RemoteCvDatasource {
  Future<BaseResponse<void>> sendCv(
    BodyMap body,
  ) async {
    final rowData =
        await Http.postFormData(uri: EndPoints.sendCv(), body: body);
    return BaseResponse.fromJson(
        json: jsonDecode(rowData), dataConverter: (d) {});
  }

  Future<BaseResponse<List<RoadMapModel>>> getRoadmaps() async {
    final rowData = await Http.get(uri: EndPoints.getRoadMaps());
    return BaseResponse.fromJson(
        json: jsonDecode(rowData), dataConverter: roadMapsListFromJson);
  }

  Future<BaseResponse<List<CategoryModel>>> getCategories() async {
    final rowData = await Http.get(uri: EndPoints.getCategories());
    return BaseResponse.fromJson(
        json: jsonDecode(rowData), dataConverter: categoriesListFromJson);
  }
}
