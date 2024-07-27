import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/config/type_defs.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/image_model.dart';

abstract class MediaUploadRepository {
  Future<Either<Failure, ImageUploadModel>> uploadImage(BodyMap body);
}
