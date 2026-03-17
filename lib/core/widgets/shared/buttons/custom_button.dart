import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

enum ButtonType { primary, secondary, icon, delete }

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final double horizontalPadding , verticalPadding;
  final VoidCallback? onPressed;
  final ButtonType type;

  /// Primary button (default)
  const CustomButton({
    super.key,
    required String this.text,
    required this.onPressed,
      this.horizontalPadding = 16,
      this.verticalPadding = 16,
  }) : icon = null,
       type = ButtonType.primary;

  /// Secondary button
  const CustomButton.secondary({
    super.key,
    required String this.text,
    required this.onPressed,
    this.horizontalPadding = 16,
    this.verticalPadding = 16,

  }) : icon = null,
       type = ButtonType.secondary;

  /// Icon button
  const CustomButton.icon({
    super.key,
    required Widget this.icon,
    required this.onPressed,
    this.horizontalPadding = 16,
    this.verticalPadding = 16,
  }) : text = null,
       type = ButtonType.icon;

  /// Delete button
  const CustomButton.delete({
    super.key,
    required String this.text,
    required this.onPressed,
  }) : icon = null,
       type = ButtonType.secondary;

  bool get isEnabled => onPressed != null;

  Color _backgroundColor() {
    if (!isEnabled) {
      return type == ButtonType.primary
          ? AppColors.primary[900]!
          : AppColors.grey[900]!;
    }

    switch (type) {
      case ButtonType.primary:
        return AppColors.primary[400]!;
      case ButtonType.secondary:
      case ButtonType.icon:
      case ButtonType.delete:
        return AppColors.grey[900]!;
    }
  }

  BorderSide _border() {
    if (type == ButtonType.primary) {
      return BorderSide.none;
    }

    return BorderSide(color: AppColors.grey[600]!, width: 1);
  }

  TextStyle _textStyle(BuildContext context) {
    final baseTextStyle = context.bodyMedium.copyWith(
      fontWeight: FontWeight.bold,
    );

    if (!isEnabled) {
      return baseTextStyle.copyWith(color: AppColors.grey[400]);
    }

    if (type == ButtonType.primary) {
      return baseTextStyle;
    }

    if (type == ButtonType.delete) {
      return baseTextStyle.copyWith(color: AppAlertColors.error);
    }

    return baseTextStyle.copyWith(color: AppColors.grey[400]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: type == ButtonType.icon ? null : double.infinity,
      child: Material(
        color: _backgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: _border(),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
            child: type == ButtonType.icon
                ? icon
                : Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: _textStyle(context),
                  ),
          ),
        ),
      ),
    );
  }
}
