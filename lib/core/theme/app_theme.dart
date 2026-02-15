import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/theme/text_theme.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    fontFamily: 'SpaceGrotesk',
    textTheme: buildTextTheme(),

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary[500]!,
      onPrimary: Colors.white,
      secondary: AppColors.primary[300]!,
      onSecondary: Colors.white,
      error: AppAlertColors.error,
      onError: Colors.white,
      surface: AppColors.grey[50]!,
      onSurface: AppColors.grey[800]!,
    ),

    scaffoldBackgroundColor: AppColors.grey[50],

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey[50],
      foregroundColor: AppColors.grey[800],
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary[500],
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey[100],
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary[500]!),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

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
      onSecondary: Colors.black,
      error: AppAlertColors.error,
      onError: Colors.black,
      surface: AppColors.grey[700]!,
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
      fillColor: AppColors.grey[700],
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
