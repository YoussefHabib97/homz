import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppColorScheme {
  static ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: ColorScales.primary[500]!,
    onPrimary: ColorScales.grey[50]!,
    secondary: ColorScales.grey[600]!,
    onSecondary: ColorScales.grey[50]!,
    error: AppAlertColors.error,
    onError: ColorScales.grey[50]!,
    surface: ColorScales.grey[50]!,
    onSurface: ColorScales.grey[900]!,
  );
}
