import 'package:easy_localization/easy_localization.dart';
import 'package:hitbitz/core/config/app_strings.dart';

extension DateTimeSince on DateTime {
  String formatDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String since() {
    final now = DateTime.now();
    final difference = now.difference(this).abs();

    final hours = difference.inHours;
    final remainingMinutes = difference.inMinutes % 60;

    if (hours > 0) {
      if (remainingMinutes > 0) {
        return '$hours ${AppStrings.hour.tr()}, $remainingMinutes ${AppStrings.minute.tr()}';
      } else {
        return '$hours ${AppStrings.hour.tr()}';
      }
    } else if (remainingMinutes > 0) {
      return '$remainingMinutes ${AppStrings.minute.tr()}';
    } else {
      return '0 ${AppStrings.minute.tr()}';
    }
  }
}
