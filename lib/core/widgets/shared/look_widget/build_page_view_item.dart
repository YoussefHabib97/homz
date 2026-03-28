import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/look_widget/apertments_details.dart';
import 'package:homz/shared/buttons/rounded_button.dart';

class BuildPageViewItem extends StatelessWidget {
  final String imagesPath;
  final int currentIndex;
  const BuildPageViewItem({
    super.key,
    required this.imagesPath,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagesPath,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          top: 40.h,
          left: 16.w,
          right: 16.w,
          child: Row(
            children: List.generate(6, (index) {
              bool isActive = index == currentIndex;
              return Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.grey[50] : AppColors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          ),
        ),

        Positioned(
          top: 64.h,
          left: 16.w,
          child: RoundedButton(
            backgroundColor: Colors.black,
            iconPath: kIconArrowLeft,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          bottom: 32.h,
          left: 16.w,
          right: 16.w,
          child: ApertmentsDetails(),
        ),
      ],
    );
  }
}
