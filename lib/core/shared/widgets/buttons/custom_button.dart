import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/widgets/models/button_config_model.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final double horizontalPadding;
  final double verticalPadding;
  final ButtonType type;

  const CustomButton._({
    this.text,
    this.icon,
    required this.onPressed,
    required this.type,
    this.horizontalPadding = kPaddingHorizontal,
    this.verticalPadding = kPaddingVertical,
  });

  factory CustomButton.primary({
    required String text,
    required VoidCallback? onPressed,
    double horizontalPadding = kPaddingHorizontal,
    double verticalPadding = kPaddingVertical,
  }) {
    return CustomButton._(
      text: text,
      onPressed: onPressed,
      type: ButtonType.primary,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
    );
  }

  factory CustomButton.secondary({
    required String text,
    required VoidCallback? onPressed,
    double horizontalPadding = kPaddingHorizontal,
    double verticalPadding = kPaddingVertical,
  }) {
    return CustomButton._(
      text: text,
      onPressed: onPressed,
      type: ButtonType.secondary,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
    );
  }

  factory CustomButton.delete({
    required String text,
    required VoidCallback? onPressed,
    double horizontalPadding = kPaddingHorizontal,
    double verticalPadding = kPaddingVertical,
  }) {
    return CustomButton._(
      text: text,
      onPressed: onPressed,
      type: ButtonType.delete,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
    );
  }

  factory CustomButton.icon({
    required Widget icon,
    required VoidCallback? onPressed,
    double horizontalPadding = kPaddingHorizontal,
    double verticalPadding = kPaddingVertical,
  }) {
    return CustomButton._(
      icon: icon,
      onPressed: onPressed,
      type: ButtonType.icon,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
    );
  }

  bool get isEnabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    final config = ButtonConfig.get(type);

    return SizedBox(
      width: config.isFullWidth ? double.infinity : null,
      child: Material(
        color: config.backgroundColor(isEnabled),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: config.border,
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: type == ButtonType.icon
                ? icon
                : Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: config.textStyle(context, isEnabled),
                  ),
          ),
        ),
      ),
    );
  }
}
