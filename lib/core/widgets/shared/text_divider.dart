import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(child: Divider(color: AppColors.grey[400]!)),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.grey[400]),
        ),
        Expanded(child: Divider(color: AppColors.grey[400]!)),
      ],
    );
  }
}
