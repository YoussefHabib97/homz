import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

enum ButtonType { primary, secondary, icon, delete }

class ButtonConfig {
  final Color Function(bool isEnabled) backgroundColor;
  final BorderSide border;
  final TextStyle Function(BuildContext, bool isEnabled) textStyle;
  final bool isFullWidth;

  const ButtonConfig({
    required this.backgroundColor,
    required this.border,
    required this.textStyle,
    required this.isFullWidth,
  });

  static ButtonConfig get(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return ButtonConfig(
          isFullWidth: true,
          border: BorderSide.none,
          backgroundColor: (isEnabled) =>
              isEnabled ? AppColors.primary[400]! : AppColors.primary[900]!,
          textStyle: (context, isEnabled) {
            final base = context.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            );
            return isEnabled ? base : base.copyWith(color: AppColors.grey[400]);
          },
        );

      case ButtonType.secondary:
        return ButtonConfig(
          isFullWidth: true,
          border: BorderSide(color: AppColors.grey[600]!, width: 1),
          backgroundColor: (isEnabled) => AppColors.grey[900]!,
          textStyle: (context, isEnabled) {
            final base = context.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.grey[400],
            );
            return isEnabled ? base : base.copyWith(color: AppColors.grey[400]);
          },
        );

      case ButtonType.delete:
        return ButtonConfig(
          isFullWidth: true,
          border: BorderSide(color: AppColors.grey[600]!, width: 1),
          backgroundColor: (isEnabled) => AppColors.grey[900]!,
          textStyle: (context, isEnabled) {
            final base = context.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            );
            return isEnabled
                ? base.copyWith(color: AppAlertColors.error)
                : base.copyWith(color: AppColors.grey[400]);
          },
        );

      case ButtonType.icon:
        return ButtonConfig(
          isFullWidth: false,
          border: BorderSide(color: AppColors.grey[600]!, width: 1),
          backgroundColor: (isEnabled) => AppColors.grey[900]!,
          textStyle: (_, _) => const TextStyle(), // unused
        );
    }
  }
}
