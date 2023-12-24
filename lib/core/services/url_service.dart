import 'package:url_launcher/url_launcher.dart';

class UrlService {
  UrlService._();

  static Future<bool> launchWeb(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.externalNonBrowserApplication);

  static Future<bool> launchPhoneNumber(String phoneNumber) => launchUrl(Uri.parse("tel:$phoneNumber"));

  // static launchLocation({required String? longitude, required String? latitude}) {
  //   if (latitude == null || longitude == null) return;
  //   launchUrl(
  //     Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude"),
  //     mode: LaunchMode.externalNonBrowserApplication,
  //   );
  // }

  // launchPolyLine({required String longitudeEnd, required String latitudeEnd, required bool isWalk}) async {
  //   final location = await LocationService.getLocation();
  //   if (location != null) {
  //     double longitudeStart = location.longitude!;
  //     double latitudeStart = location.latitude!;
  //     launchUrl(
  //       Uri.parse(
  //         "https://www.google.com/maps/dir/?api=1&origin=$latitudeStart,$longitudeStart&destination=$latitudeEnd,$longitudeEnd&travelmode=${isWalk ? "walking" : "driving"}&dir_action=navigate",
  //       ),
  //       mode: LaunchMode.externalNonBrowserApplication,
  //     );
  //   }
  // }
}
