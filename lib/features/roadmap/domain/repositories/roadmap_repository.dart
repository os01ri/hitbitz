import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';

abstract class RoadMapRepository {
  Future<Either<Failure, RoadMapModel>> showRoadMap({required int id, required ParamsMap params});
  Future<Either<Failure, RoadMapModel>> startRoadMap({required int id, required ParamsMap params});
  Future<Either<Failure, List<StepModel>>> getSteps({required ParamsMap params});
  Future<Either<Failure, NoResponse>> roadMapToggleBookmark({required int id});
  Future<Either<Failure, List<RoadMapModel>>> getSavedRoadmaps({required ParamsMap params});
}
