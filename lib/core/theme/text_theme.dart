import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme buildTextTheme() {
  return TextTheme(
    displaySmall: TextStyle(fontSize: 38.w, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 30.w, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 22.w, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 16.w, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16.w),
    bodyMedium: TextStyle(fontSize: 14.w),
    bodySmall: TextStyle(fontSize: 12.w),
    labelLarge: TextStyle(fontSize: 10.w),
    labelSmall: TextStyle(fontSize: 8.w),
  ).apply(fontFamily: 'SpaceGrotesk');
}
