import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';

class SectionItem extends StatelessWidget {
  final String iconPath;
  final String label;
  const SectionItem({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return  Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 20.w,
                    height: 20.h,
                    
                  ),
                  HorizontalGap(4),
                  Text(
                    label,
                    style: context.bodyMedium.copyWith(color: AppColors.grey[50]),
                  ),
                  HorizontalGap(34)
                ],
              );
  }
}