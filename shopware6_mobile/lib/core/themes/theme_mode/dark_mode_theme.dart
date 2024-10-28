import 'package:flutter/material.dart';

import '../app_theme.dart';

class DarkModeTheme extends AppTheme {
  @override
  Color get background => const Color(0xffffffff);

  @override
  Color get secondary => const Color(0x004C545A);

  @override
  Color get borderColor => const Color(0x004C545A).withOpacity(0.8);

  @override
  Color get snackbarColor => const Color(0xE5252525);

  @override
  Color get primary => const Color(0x003A6DA3);

  @override
  Color get onPrimary => const Color(0xffffffff);

  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: primary,
        secondary: secondary,
        surface: background,
        brightness: Brightness.dark,
        error: error,
        onPrimary: onPrimary,
        onSurface: background,
        onError: background,
        onSecondary: background,
      );
}
