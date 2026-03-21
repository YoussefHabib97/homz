import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RoundedButton extends StatelessWidget {
  final Color backgroundColor;
  final String iconPath;
  final void Function() onPressed;
  const RoundedButton({
    super.key,
    required this.backgroundColor,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
        ),
      ),
    );
  }
}
