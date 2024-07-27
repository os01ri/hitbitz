import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/features/cv/data/datasources/cv_datasource.dart';
import 'package:hitbitz/features/cv/domain/repositories/cv_repo.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/roadmap/data/models/road_map_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/repository_exception_handler.dart';

@Injectable(as: CvRepo)
class CvRepoImpl with RepositoryExceptionHandler implements CvRepo {
  final RemoteCvDatasource datasource;
  CvRepoImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, void>> sendCv(BodyMap body) async {
    return exceptionHandler(tryCall: () async {
      final result = await datasource.sendCv(body);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    return exceptionHandler(tryCall: () async {
      final result = await datasource.getCategories();
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, List<RoadMapModel>>> getRoadmaps() async {
    return exceptionHandler(tryCall: () async {
      final result = await datasource.getRoadmaps();
      return Right(result.data);
    });
  }
}
