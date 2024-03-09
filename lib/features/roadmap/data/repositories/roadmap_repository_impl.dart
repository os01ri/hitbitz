import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/roadmap/data/datasources/remote_roadmap_datasource.dart';
import 'package:hitbitz/features/roadmap/data/models/level_model.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RoadMapRepository)
class RoadMapRepositoryImpl with RepositoryExceptionHandler implements RoadMapRepository {
  final RemoteRoadMapDataSource remoteDataSource;

  const RoadMapRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LevelModel>>> getLevels({required BodyMap body}) {
    return exceptionHandler<List<LevelModel>>(tryCall: () async {
      final result = await remoteDataSource.getLevels(body: body);
      return Right(result.data);
    });
  }
}
