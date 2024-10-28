import 'package:flutter/material.dart';

import '../constants.dart';
import '../extensions/app_text_font_weight_extension.dart';
import 'theme_mode/dark_mode_theme.dart';
import 'theme_mode/light_mode_theme.dart';

abstract class AppTheme {
  ColorScheme get colorScheme;
  Color get error => const Color(0xFFFF0000);
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get background;
  Color get borderColor;
  Color get greyScaleLight100;
  Color get snackbarColor;

  TextStyle get title1 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.semiBold.fontWeight,
        fontSize: 24,
      );

  TextStyle get title2 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.bold.fontWeight,
        fontSize: 20,
      );

  TextStyle get title3 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.bold.fontWeight,
        fontSize: 18,
      );

  TextStyle get subtitle1 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.semiBold.fontWeight,
        fontSize: 16,
      );

  TextStyle get bodyText1 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.normal.fontWeight,
        fontSize: 16,
      );

  TextStyle get bodyText2 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.normal.fontWeight,
        fontSize: 14,
      );

  TextStyle get bodyText3 => TextStyle(
        color: colorScheme.secondary,
        fontWeight: AppTextFontWeight.normal.fontWeight,
        fontSize: 12,
      );
}

class AppThemeData {
  final _darkModeTheme = DarkModeTheme();
  final _ligtModeTheme = LightModeTheme();

  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: _darkModeTheme.background,
        colorScheme: _darkModeTheme.colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: _darkModeTheme.background,
          centerTitle: true,
        ),
        bottomSheetTheme:
            BottomSheetThemeData(dragHandleColor: _darkModeTheme.background),
        useMaterial3: true,
      );

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: _ligtModeTheme.background,
        colorScheme: _ligtModeTheme.colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: _ligtModeTheme.background,
          centerTitle: true,
        ),
        bottomSheetTheme:
            BottomSheetThemeData(dragHandleColor: _ligtModeTheme.background),
        useMaterial3: true,
      );
}
