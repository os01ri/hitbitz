import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RedeemCertificateUsecase implements UseCase<String, int> {
  final RoadMapRepository repository;

  const RedeemCertificateUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(int roadmapId) async {
    return repository.redeemCertificate(params: {'roadmapId': roadmapId.toString()});
  }
}
