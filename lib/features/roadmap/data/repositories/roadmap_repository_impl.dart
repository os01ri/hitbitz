import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/roadmap/data/datasources/remote_roadmap_datasource.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/data/models/step_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RoadMapRepository)
class RoadMapRepositoryImpl with RepositoryExceptionHandler implements RoadMapRepository {
  final RemoteRoadMapDataSource remoteDataSource;

  const RoadMapRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LevelModel>>> getLevels({required ParamsMap params}) {
    return exceptionHandler<List<LevelModel>>(tryCall: () async {
      final result = await remoteDataSource.getLevels(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, List<StepModel>>> getSteps({required ParamsMap? params}) {
    return exceptionHandler<List<StepModel>>(tryCall: () async {
      final result = await remoteDataSource.getSteps(params: params);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, NoResponse>> roadMapToggleBookmark({required int id}) {
    return exceptionHandler<NoResponse>(tryCall: () async {
      final result = await remoteDataSource.roadMapToggleBookmark(id: id);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, List<RoadMapModel>>> getSavedRoadmaps({required ParamsMap params}) {
    return exceptionHandler<List<RoadMapModel>>(tryCall: () async {
      final result = await remoteDataSource.getSavedRoadmaps(params: params);
      return Right(result.data);
    });
  }
}
