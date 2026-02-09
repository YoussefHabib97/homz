import 'package:flutter/material.dart';
import 'package:homz/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Ink(
        decoration: BoxDecoration(
          color: isPrimary ? ColorScales.primary[400] : ColorScales.grey[900],
          border: isPrimary
              ? null
              : Border.all(color: ColorScales.grey[600]!, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: isPrimary
                  ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorScales.grey[400],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
