import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/theme/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;

  final String? iconPath;
  final Color? iconColor;

  final String? text;
  final bool isNumber;

  const RoundedButton._({
    super.key,
    required this.backgroundColor,
    required this.onPressed,
    this.iconPath,
    this.iconColor,
    this.text,
    this.isNumber = false,
  });

  factory RoundedButton.icon({
    Key? key,
    required Color backgroundColor,
    required String iconPath,
    Color? iconColor,
    required VoidCallback onPressed,
  }) {
    return RoundedButton._(
      key: key,
      backgroundColor: backgroundColor,
      iconPath: iconPath,
      iconColor: iconColor,
      onPressed: onPressed,
    );
  }

  factory RoundedButton.number({
    Key? key,
    required Color backgroundColor,
    required String number,
    required VoidCallback onPressed,
  }) {
    return RoundedButton._(
      key: key,
      backgroundColor: backgroundColor,
      text: number,
      isNumber: true,
      onPressed: onPressed,
    );
  }

  factory RoundedButton.text({
    Key? key,
    required Color backgroundColor,
    required String text,
    required VoidCallback onPressed,
  }) {
    return RoundedButton._(
      key: key,
      backgroundColor: backgroundColor,
      text: text,
      isNumber: false,
      onPressed: onPressed,
    );
  }

  Color get _effectiveIconColor =>
      iconColor ?? AppColors.grey[50] ?? Colors.grey;

  bool get _isCircle => iconPath != null || isNumber;

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (iconPath != null) {
      child = SvgPicture.asset(
        iconPath!,
        height: 24.h,
        width: 24.w,
        colorFilter: ColorFilter.mode(_effectiveIconColor, BlendMode.srcIn),
      );
    } else if (text != null) {
      child = Text(
        text!,
        style: TextStyle(
          fontSize: isNumber ? 14.sp : 13.sp,
          fontWeight: isNumber ? FontWeight.bold : FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    } else {
      child = const SizedBox.shrink();
    }

    return Material(
      color: backgroundColor,
      shape: _isCircle
          ? const CircleBorder()
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: _isCircle
              ? EdgeInsets.all(8.r)
              : EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Center(child: child),
        ),
      ),
    );
  }
}
