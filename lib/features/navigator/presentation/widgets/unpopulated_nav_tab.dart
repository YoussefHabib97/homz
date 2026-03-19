import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/extensions/extensions.dart';

class UnpopulatedNavTabBody extends StatelessWidget {
  final String imagePath, title, subtitle;
  const UnpopulatedNavTabBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          Text(
            title,
            style: context.bodyLarge.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            subtitle,
            style: context.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
