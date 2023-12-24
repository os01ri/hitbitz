// TODO: uncomment this file in production

// import 'dart:developer';
// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:hitbitz/core/extensions/colorful_logging_extension.dart';

class DeviceInfoService {
  const DeviceInfoService._();

  static Future<String> getDeviceId() async {
    return 'TE1A.220922.021';
    // final deviceInfo = DeviceInfoPlugin();

    // if (Platform.isIOS) {
    //   final iosDeviceInfo = await deviceInfo.iosInfo;
    //   log(iosDeviceInfo.identifierForVendor ?? '', name: "IOSDeviceId");
    //   return iosDeviceInfo.identifierForVendor ?? '';
    // } else if (Platform.isAndroid) {
    //   final androidDeviceInfo = await deviceInfo.androidInfo;
    //   log(androidDeviceInfo.id.logMagenta, name: "AndroidDeviceId");
    //   return androidDeviceInfo.id;
    // }
    // return '';
  }
}
