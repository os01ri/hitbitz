import 'dart:convert';

import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/base_response.dart';
import 'package:hitbitz/features/quiz/data/models/quiz_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteQuizDataSource {
  const RemoteQuizDataSource();

  Future<BaseResponse<List<QuizModel>>> getQuizzes({required ParamsMap params}) async {
    final rowData = await Http.get(uri: EndPoints.getQuizzes(params: params));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => quizModelFromJson(body),
    );
  }

  Future<BaseResponse<QuizModel>> showQuiz({required int id}) async {
    final rowData = await Http.get(uri: EndPoints.showQuiz(id: id));
    return BaseResponse.fromJson(
      json: json.decode(rowData),
      dataConverter: (body) => QuizModel.fromJson(body),
    );
  }
}
