import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';

abstract class MainRepository {
  Future<Either<Failure, NoResponse>> makeSuggestion({required BodyMap body});
}
