import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/theme/text_theme.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    fontFamily: 'SpaceGrotesk',
    textTheme: buildTextTheme(),

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary[300]!,
      onPrimary: Colors.white,
      secondary: AppColors.primary[200]!,
      onSecondary: AppColors.grey[900]!,
      error: AppAlertColors.error,
      onError: AppColors.grey[900]!,
      surface: AppColors.grey[900]!,
      onSurface: AppColors.grey[100]!,
    ),

    scaffoldBackgroundColor: AppColors.grey[900],

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey[900],
      foregroundColor: AppColors.grey[100],
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary[300],
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.grey[600],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey[600]!),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
