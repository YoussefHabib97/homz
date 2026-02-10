import 'package:flutter/material.dart';

class ColorScales {
  static const primary = {
    50: Color(0xFFECF0F7),
    100: Color(0xFFE3E8F3),
    200: Color(0xFFC4D0E7),
    300: Color(0xFF4267B2),
    400: Color(0xFF3B5DA0),
    500: Color(0xFF35528E),
    600: Color(0xFF324D86),
    700: Color(0xFF283E6B),
    800: Color(0xFF1E2E50),
    900: Color(0xFF17243E),
  };

  static const grey = {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFF2F2F2),
    200: Color(0xFFE6E6E6),
    300: Color(0xFFA0A0A0),
    400: Color(0xFF636363),
    500: Color(0xFF3F3F41),
    600: Color(0xFF232323),
    700: Color(0xFF2C2C2E),
    800: Color(0xFF060607),
    900: Color(0xFF000000),
  };
}

class AppAlertColors {
  static const success = Color(0xFF29AE29);
  static const warning = Color(0xFFFFC62A);
  static const error = Color(0xFFEF4444);
}

class AppColors {
  static final primary = ColorScales.primary[500]!;
  static final primaryPressed = ColorScales.primary[700]!;

  static final background = ColorScales.grey[900]!;
  static final surface = ColorScales.grey[100]!;

  static final divider = ColorScales.grey[200]!;
  static final disabled = ColorScales.grey[300]!;
}
