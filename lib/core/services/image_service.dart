import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/app_colors.dart';
import '../utilities/toaster.dart';

class ImageService {
  const ImageService._();

  static Future<File?> pickImage() async => await _ImageHelper.getImageAndCrop();

  static downloadImage(String url, {String? outputMimeType}) async {
    String? message;

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Get the image name
      final imageName = url.split('/').last;

      // Create an image name
      var filename = '${dir.path}/$imageName';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'downloaded successfully';
      }
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      Toaster.showToast(message);
    }
  }
}

class _ImageHelper {
  const _ImageHelper._();

  static Future<void> _requestPermission() async {
    const status = Permission.camera;
    if ((await status.isDenied)) {
      _requestPermission();
    }
  }

  static Future<File?> getImageAndCrop({
    CropAspectRatio aspectRatio = const CropAspectRatio(ratioX: 1, ratioY: 1),
  }) async {
    await _requestPermission();

    File? image;

    final XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

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
          toolbarTitle: 'اقتصاص'.tr(),
          toolbarColor: AppColors.primaryColor,
          toolbarWidgetColor: AppColors.lightSurfaceContainer,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
          title: 'اقتصاص'.tr(),
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
