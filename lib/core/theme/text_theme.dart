import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme buildTextTheme() {
  return TextTheme(
    displaySmall: TextStyle(fontSize: 38.sp, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16.sp),
    bodyMedium: TextStyle(fontSize: 14.sp),
    bodySmall: TextStyle(fontSize: 12.sp),
    labelLarge: TextStyle(fontSize: 10.sp),
    labelSmall: TextStyle(fontSize: 8.sp),
  ).apply(fontFamily: 'SpaceGrotesk');
}
