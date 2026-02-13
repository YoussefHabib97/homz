import 'package:flutter/material.dart';
import 'package:homz/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  const CustomButton({
    super.key,
    this.isPrimary = true,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Ink(
        decoration: BoxDecoration(
          color: onPressed != null
              ? (isPrimary ? ColorScales.primary[500] : ColorScales.grey[900])
              : isPrimary
              ? ColorScales.primary[900]
              : ColorScales.grey[900],
          border: onPressed != null
              ? (isPrimary
                    ? null
                    : Border.all(color: ColorScales.grey[600]!, width: 1))
              : isPrimary
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
              style: onPressed != null
                  ? (isPrimary
                        // If the button is enabled and primary, use the default text color for better contrast
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          )
                        // If the button is enabled and not primary, use a lighter text color for better contrast
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorScales.grey[50],
                          ))
                  :
                    // If the button is disabled and primary, use a muted text color regardless of primary state for better accessibility
                    isPrimary
                  ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorScales.grey[400],
                    )
                  // If the button is disabled and not primary, use the same muted text color for consistency
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
