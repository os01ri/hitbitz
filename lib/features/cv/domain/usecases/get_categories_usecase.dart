import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/cv/domain/repositories/cv_repo.dart';
import 'package:hitbitz/features/home/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesForCvUsecase
    implements UseCase<List<CategoryModel>, NoParams> {
  final CvRepo repo;
  GetCategoriesForCvUsecase({
    required this.repo,
  });
  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParams params) async {
    return await repo.getCategories();
  }
}
