import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';

class AppDefaultPadding extends StatelessWidget {
  final double horizontalOffset, verticalOffset;
  final Widget child;
  const AppDefaultPadding({
    super.key,
    this.verticalOffset = kVerticalPadding,
    this.horizontalOffset = kHorizontalPadding,
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

class HorizontalGap extends StatelessWidget {
  final double width;
  const HorizontalGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}

class VerticalGap extends StatelessWidget {
  final double height;
  const VerticalGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
