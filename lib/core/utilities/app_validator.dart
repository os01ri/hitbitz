import 'package:easy_localization/easy_localization.dart';
import 'package:hitbitz/core/config/app_strings.dart';

class AppValidator {
  const AppValidator._();

  static String? required(String? value) {
    if ((value ?? '').isEmpty) return AppStrings.fieldRequired.tr();
    return null;
  }

  static String? name(String? value) {
    if ((value ?? '').isEmpty) return AppStrings.fieldRequired.tr();
    if (value!.length < 2) return AppStrings.invalidName.tr();
    final hasMatches = RegExp(r'^[A-Za-z\u0600-\u06FF]+$').hasMatch(value);
    if (!hasMatches) return AppStrings.invalidName.tr();
    return null;
  }

  static String? password(String? value) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
    if ((value ?? '').isEmpty || !passwordRegex.hasMatch(value!)) return AppStrings.passwordRequirements.tr();
    return null;
  }

  static String? email(String? value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if ((value ?? '').isEmpty || !emailRegex.hasMatch(value!)) return AppStrings.invalidEmail.tr();
    return null;
  }
}
