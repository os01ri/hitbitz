import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';

abstract class RoadMapRepository {
  Future<Either<Failure, List<LevelModel>>> getLevels({required ParamsMap params});
  Future<Either<Failure, List<StepModel>>> getSteps({required ParamsMap params});
}
