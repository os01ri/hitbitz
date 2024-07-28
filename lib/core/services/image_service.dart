import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:hitbitz/core/config/app_strings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/app_colors.dart';

class ImageService {
  const ImageService._();

  static Future<File?> pickImage() async => await _ImageHelper.getImageAndCrop();
}

class _ImageHelper {
  const _ImageHelper._();

  static Future<void> _requestPermission() async {
    const status = Permission.mediaLibrary;
    if ((await status.isDenied)) {
      _requestPermission();
    }
  }

  static Future<File?> getImageAndCrop({
    CropAspectRatio aspectRatio = const CropAspectRatio(ratioX: 1, ratioY: 1),
  }) async {
    await _requestPermission();

    File? image;

    final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      final result = await _crop(file: xFile, aspectRatio: aspectRatio);
      if (result != null) image = result;
    }

    return image;
  }

  static Future<File?> _crop({
    required XFile file,
    required CropAspectRatio aspectRatio,
  }) async {
    final imageCropper = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: aspectRatio,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: AppStrings.crop.tr(),
          toolbarColor: AppColors.primaryColor,
          toolbarWidgetColor: AppColors.lightSurfaceContainer,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
          title: AppStrings.crop.tr(),
          resetAspectRatioEnabled: true,
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (imageCropper != null) {
      return File(imageCropper.path);
    }
    return null;
  }
}
