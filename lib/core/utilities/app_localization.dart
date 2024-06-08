import 'package:flutter/material.dart';

class AppLocalization {
  const AppLocalization._();

  static const arLocale = Locale('ar', 'SY');
  static const enLocale = Locale('en', 'US');
  static const frLocale = Locale('fr', 'FR');
  static const deLocale = Locale('de', 'DE');
  static List<Locale> get supportedLocales => [enLocale, arLocale, frLocale, deLocale];
  static Locale get fallbackLocale => arLocale;
}
