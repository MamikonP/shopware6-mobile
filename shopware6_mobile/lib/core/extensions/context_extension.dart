import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../themes/app_theme.dart';
import '../themes/theme_mode/dark_mode_theme.dart';
import '../themes/theme_mode/light_mode_theme.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this);

  AppTheme get themeOf => Theme.of(this).brightness == Brightness.dark
      ? DarkModeTheme()
      : LightModeTheme();

  void showErrorSnackbar(String error) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(error)));
}
