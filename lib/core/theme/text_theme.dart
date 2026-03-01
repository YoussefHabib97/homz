import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/theme/font_weight_helper.dart';

TextTheme buildTextTheme() {
  return const TextTheme(
    displaySmall: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(fontSize: 12),
    labelSmall: TextStyle(fontSize: 10),
  ).apply(fontFamily: 'SpaceGrotesk');
}

class AppTextStyles {
  static TextStyle font32Gray50Bold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.grey[50]!,
  );

  static TextStyle font16Gray50Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.grey[50]!,
  );


  static TextStyle font16Blue50Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.primary[50]!,
  );

   static TextStyle font16Blue50Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primary[50]!,
  );
  
  }
