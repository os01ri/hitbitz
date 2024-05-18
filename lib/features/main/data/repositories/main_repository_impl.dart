import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/data/models/no_response_model.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';
import 'package:hitbitz/features/main/data/datasources/remote_main_datasource.dart';
import 'package:hitbitz/features/main/domain/repositories/main_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MainRepository)
class MainRepositoryImpl with RepositoryExceptionHandler implements MainRepository {
  final RemoteMainDataSource remoteDataSource;

  const MainRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NoResponse>> makeSuggestion({required BodyMap body}) {
    return exceptionHandler<NoResponse>(tryCall: () async {
      final result = await remoteDataSource.makeSuggestion(body: body);
      return Right(result);
    });
  }
}
