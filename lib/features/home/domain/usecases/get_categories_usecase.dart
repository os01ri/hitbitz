import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:hitbitz/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase implements UseCase<List<CategoryModel>, GetCategoriesParams> {
  final HomeRepository repository;

  GetCategoriesUsecase({required this.repository});
  @override
  Future<Either<Failure, List<CategoryModel>>> call(GetCategoriesParams params) async {
    return repository.getCategories(body: params.getBody());
  }
}

class GetCategoriesParams implements UseCaseParams {
  const GetCategoriesParams();

  @override
  BodyMap getBody() => {};

  @override
  ParamsMap? getParams() => {};
}
