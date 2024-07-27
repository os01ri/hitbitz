import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';

import '../model/image_model.dart';

class RemoteMediaUploadDataSources {
  Future<BaseResponse<ImageUploadModel>> imageUpload(BodyMap body) async {
    final rowData = await Http.postFormData(uri: EndPoints.uploadImage(), body: body);
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => ImageUploadModel.fromJson(body),
    );
  }
}
