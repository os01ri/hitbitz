import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/roadmap/domain/repositories/roadmap_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/certif_model.dart';

@injectable
class RedeemCertificateUsecase implements UseCase<RedeemCertificateModel, int> {
  final RoadMapRepository repository;

  const RedeemCertificateUsecase({required this.repository});

  @override
  Future<Either<Failure, RedeemCertificateModel>> call(int roadmapId) async {
    return repository
        .redeemCertificate(params: {'roadmapId': roadmapId.toString()});
  }
}
