import 'package:hitbitz/core/api/end_points.dart';
import 'package:hitbitz/core/api/http.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoteMainDataSource {
  const RemoteMainDataSource();

  Future<NoResponse> makeSuggestion({required BodyMap body}) async {
    await Http.post(uri: EndPoints.makeSuggestion(), body: body);
    return NoResponse();
  }
}
