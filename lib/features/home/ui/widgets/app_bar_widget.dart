import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            "Home",
            style: context.headlineLarge.copyWith(color: AppColors.grey[50]),
          ),
          Spacer(),
          // add notification icon here as svg
         InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              kIconNotification,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }
}