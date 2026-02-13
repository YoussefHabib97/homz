import 'package:flutter/material.dart';
import 'package:homz/theme/app_colors.dart';
import 'package:homz/theme/text_theme.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'SpaceGrotesk',
    brightness: Brightness.dark,
    textTheme: buildTextTheme(),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.surface,
    dividerColor: AppColors.divider,
    disabledColor: AppColors.disabled,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: ColorScales.grey[50]!,
      secondary: AppColors.primary,
      onSecondary: ColorScales.grey[50]!,
      surface: AppColors.surface,
      onSurface: ColorScales.grey[50]!,
      error: AppAlertColors.error,
      onError: ColorScales.grey[50]!,
    ),
  );
}
