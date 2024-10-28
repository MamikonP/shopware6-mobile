import 'package:flutter/material.dart';

import '../constants/enums/app_text_font_weight.dart';
import '../extensions/app_text_font_weight_extension.dart';
import 'theme_mode/dark_mode_theme.dart';
import 'theme_mode/light_mode_theme.dart';

abstract class AppTheme {
  static AppTheme currentThemeOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color get error => const Color(0xFFFF0000);
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get background;
  Color get borderColor;
  ColorScheme get colorScheme;
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
  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: DarkModeTheme().background,
        colorScheme: DarkModeTheme().colorScheme,
        appBarTheme: AppBarTheme(backgroundColor: DarkModeTheme().primary),
        bottomSheetTheme:
            BottomSheetThemeData(dragHandleColor: DarkModeTheme().primary),
        useMaterial3: true,
      );

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: LightModeTheme().background,
        colorScheme: LightModeTheme().colorScheme,
        appBarTheme: AppBarTheme(backgroundColor: LightModeTheme().primary),
        bottomSheetTheme:
            BottomSheetThemeData(dragHandleColor: LightModeTheme().primary),
        useMaterial3: true,
      );
}
