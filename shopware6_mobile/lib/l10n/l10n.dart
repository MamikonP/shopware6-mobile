import 'package:flutter/material.dart';

abstract class L10n {
  static final locales = <Locale>[
    const Locale('en', 'US'),
  ];

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale != null && locale.countryCode != null) {
      if (supportedLocales.contains(locale)) {
        return locale;
      } else if (supportedLocales.contains(Locale(locale.languageCode))) {
        return Locale(locale.languageCode);
      }
    }
    return const Locale('en');
  }
}
