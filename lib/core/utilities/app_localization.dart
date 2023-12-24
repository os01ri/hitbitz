import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  const AppLocalization._();

  static const arLocale = Locale('ar', 'SY');
  static const enLocale = Locale('en', 'US');
  static get supportedLocales => [enLocale, arLocale];
  static get fallbackLocale => arLocale;

  static bool isEnglish(BuildContext context) => context.locale.languageCode == enLocale.languageCode;

  static reverseLang(BuildContext context) => isEnglish(context) ? context.setLocale(arLocale) : context.setLocale(enLocale);
}
