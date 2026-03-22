import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';

class DefaultPadding extends StatelessWidget {
  final double horizontalOffset, verticalOffset;
  final Widget child;
  const DefaultPadding({
    super.key,
    this.verticalOffset = kPaddingVertical,
    this.horizontalOffset = kPaddingHorizontal,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalOffset.w,
        vertical: verticalOffset.h,
      ),
      child: child,
    );
  }
}
