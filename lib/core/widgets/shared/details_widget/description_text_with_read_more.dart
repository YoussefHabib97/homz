import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

class DescriptionTextWithReadMore extends StatelessWidget {
  const DescriptionTextWithReadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.labelLarge.copyWith(
          color: AppColors.grey[400],
          height: 1.5,
        ),
        children: [
          const TextSpan(
            text:
                'Immaculately Renovated Townhouse In Prime Williamsburg Located at the heart of Nissano coveted neighborhood. 200 powers street........',
          ),
          TextSpan(
            text: 'Read more',
            style: TextStyle(color: AppColors.primary[300], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
