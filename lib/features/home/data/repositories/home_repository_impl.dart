import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/home/data/datasources/remote_home_datasource.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/data/models/road_map_model.dart';
import 'package:hitbitz/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl with RepositoryExceptionHandler implements HomeRepository {
  final RemoteHomeDataSource remoteDataSource;

  const HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories({required BodyMap body}) {
    return exceptionHandler<List<CategoryModel>>(tryCall: () async {
      final result = await remoteDataSource.getCategories(body: body);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, List<RoadMapModel>>> getRoadMaps({required BodyMap body}) {
    return exceptionHandler<List<RoadMapModel>>(tryCall: () async {
      final result = await remoteDataSource.getRoadMaps(body: body);
      return Right(result.data);
    });
  }
}
