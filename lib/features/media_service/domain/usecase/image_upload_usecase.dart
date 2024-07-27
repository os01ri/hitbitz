import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/usecases/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/image_model.dart';
import '../repository/media_upload_repository.dart';

class ImageUpload implements UseCase<ImageUploadModel, ImageUploadParams> {
  final MediaUploadRepository mediaUploadRepository;

  ImageUpload({required this.mediaUploadRepository});
  @override
  Future<Either<Failure, ImageUploadModel>> call(ImageUploadParams params) {
    return mediaUploadRepository.uploadImage(params.getBody());
  }
}

class ImageUploadParams implements UseCaseParams {
  final File media;

  const ImageUploadParams({required this.media});

  @override
  BodyMap getBody() => {'image': media};

  @override
  ParamsMap? getParams() {
    throw UnimplementedError();
  }
}
