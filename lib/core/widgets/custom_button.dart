import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary, isIconButton;
  final Widget? icon;
  const CustomButton({
    super.key,
    this.isPrimary = true,
    this.isIconButton = false,
    this.icon,
    this.text = "",
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: onPressed != null
            ? (isPrimary && !isIconButton
                  ? AppColors.primary[400]
                  : AppColors.grey[900])
            : isPrimary
            ? AppColors.primary[900]
            : AppColors.grey[900],

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: onPressed != null
              ? (isPrimary && !isIconButton
                    ? BorderSide.none
                    : BorderSide(color: AppColors.grey[600]!, width: 1))
              : isPrimary
              ? BorderSide.none
              : BorderSide(color: AppColors.grey[600]!, width: 1),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: isIconButton
                ? icon
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: onPressed != null
                        ? (isPrimary
                              // If the button is enabled and primary, use the default text color for better contrast
                              ? context.bodyMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                )
                              // If the button is enabled and not primary, use a lighter text color for better contrast
                              : Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grey[400],
                                ))
                        :
                          // If the button is disabled and primary, use a muted text color regardless of primary state for better accessibility
                          isPrimary
                        ? context.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey[400],
                          )
                        // If the button is disabled and not primary, use the same muted text color for consistency
                        : context.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey[400],
                          ),
                  ),
          ),
        ),
      ),
    );
  }
}
