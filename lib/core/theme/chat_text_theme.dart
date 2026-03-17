import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/theme/app_colors.dart';

class ChatTextStyles {
  static const String fontFamily = "Plus Jakarta Sans";

  static TextStyle message = TextStyle(fontSize: 14.w, fontFamily: fontFamily);

  static TextStyle timestamp = TextStyle(
    fontSize: 12.w,
    fontFamily: fontFamily,
    color: AppColors.grey[50],
  );

  static TextStyle input = TextStyle(fontSize: 16.w, fontFamily: fontFamily);
}
