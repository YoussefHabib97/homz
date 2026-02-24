import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';

class AppPadding extends StatelessWidget {
  final double verticalOffset, horizontalOffset;
  final Widget child;
  const AppPadding({
    super.key,
    this.verticalOffset = kVerticalPadding,
    this.horizontalOffset = kHorizontalPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalOffset,
        vertical: verticalOffset,
      ),
      child: child,
    );
  }
}
