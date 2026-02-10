import 'package:flutter/material.dart';
import 'package:homz/theme/app_colors.dart';

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
          color: ColorScales.grey[900],
          border: Border.all(color: ColorScales.grey[600]!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
