import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const CustomIconButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.grey[900],
          border: Border.all(color: AppColors.grey[600]!, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
