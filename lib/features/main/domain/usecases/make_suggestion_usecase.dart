import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/main/data/enums/feedback_type.dart';
import 'package:hitbitz/features/main/domain/repositories/main_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MakeSuggestionUsecase implements UseCase<NoResponse, SuggestionParams> {
  final MainRepository repository;

  MakeSuggestionUsecase({required this.repository});
  @override
  Future<Either<Failure, NoResponse>> call(SuggestionParams params) async {
    return repository.makeSuggestion(body: params.getBody());
  }
}

class SuggestionParams implements UseCaseParams {
  final FeedbackType type;
  final String description;

  const SuggestionParams({
    required this.type,
    required this.description,
  });

  @override
  BodyMap getBody() => {
        'type': type.index,
        'body': description,
      };

  @override
  ParamsMap? getParams() => {};
}
