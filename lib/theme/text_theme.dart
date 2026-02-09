import 'package:flutter/material.dart';

import 'app_colors.dart';

TextTheme buildTextTheme() {
  return TextTheme(
    displaySmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: ColorScales.grey[50],
    ),
    headlineLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ColorScales.grey[50],
    ),
    headlineMedium: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorScales.grey[50],
    ),
    headlineSmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorScales.grey[50],
    ),
    titleLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorScales.grey[50],
    ),
    bodyLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: ColorScales.grey[50],
    ),
    bodyMedium: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorScales.grey[50],
    ),
    labelLarge: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorScales.grey[50],
    ),
    labelSmall: TextStyle(
      fontFamily: 'SpaceGrotesk',
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: ColorScales.grey[50],
    ),
  );
}
