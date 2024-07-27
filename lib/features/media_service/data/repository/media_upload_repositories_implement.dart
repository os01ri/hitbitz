import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';
import 'package:hitbitz/core/error/repository_exception_handler.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repository/media_upload_repository.dart';
import '../datasource/remote_media_upload_data_sources.dart';
import '../model/image_model.dart';

class MediaUploadRepositoriesImplement with RepositoryExceptionHandler implements MediaUploadRepository {
  final _uploadMedia = RemoteMediaUploadDataSources();
  @override
  Future<Either<Failure, ImageUploadModel>> uploadImage(BodyMap body) async {
    return exceptionHandler(tryCall: () async {
      final result = await _uploadMedia.imageUpload(body);
      return Right(result.data);
    });
  }
}
