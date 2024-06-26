import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories({required ParamsMap params});
  Future<Either<Failure, List<RoadMapModel>>> getRoadMaps({required ParamsMap params, required BodyMap body});
}
