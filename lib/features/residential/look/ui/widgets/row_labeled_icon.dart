
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

class RowLabeledIcon extends StatelessWidget {
  const RowLabeledIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Spreads items evenly
        children: [
          AmenityItem(
            iconPath: kIconBathRoom,
            label: 'Bathrooms',
            onTap: () {},
          ),
          AmenityItem(iconPath: kIconBedRoom, label: 'Bedrooms', onTap: () {}),
          AmenityItem(iconPath: kIconParking, label: 'Parking', onTap: () {}),
          AmenityItem(iconPath: kIconGym, label: 'Gym', onTap: () {}),
        ],
      ),
    );
  }
}

class AmenityItem extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final String label;

  const AmenityItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration:  BoxDecoration(
            color: AppColors.primary[500],
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: onTap,
            child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
          ),
        ),

        SizedBox(height: 8.h),
        Text(
          label,
          style: context.bodySmall.copyWith(color: AppColors.primary[500]),
        ),
      ],
    );
  }
}
