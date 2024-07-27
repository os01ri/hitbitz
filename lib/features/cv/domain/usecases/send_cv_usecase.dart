import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/failures.dart';
import 'package:hitbitz/core/usecases/usecase.dart';
import 'package:hitbitz/features/cv/domain/repositories/cv_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendCvUsecase implements UseCase<void, SendCvParams> {
  final CvRepo repo;
  SendCvUsecase({
    required this.repo,
  });
  @override
  Future<Either<Failure, void>> call(SendCvParams params) async {
    return await repo.sendCv(params.toMap());
  }
}

class SendCvParams {
  final String email;
  final String username;
  final String fullName;
  final File cv;
  final int? roadmapId;
  final int? categoryId;
  SendCvParams({
    required this.email,
    required this.username,
    required this.fullName,
    required this.cv,
    this.roadmapId,
    this.categoryId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'userName': username});
    result.addAll({'fullName': fullName});
    result.addAll({'cv': cv});
    if (roadmapId != null) {
      result.addAll({'roadmapId': roadmapId});
    }
    if (categoryId != null) {
      result.addAll({'categoryId': categoryId});
    }

    return result;
  }
}
