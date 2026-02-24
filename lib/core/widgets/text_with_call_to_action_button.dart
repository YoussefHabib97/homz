import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';

class TextWithCallToActionButton extends StatelessWidget {
  final String text, buttonText;
  final TextStyle? textStyle, buttonTextStyle;
  final void Function()? onPressed;
  const TextWithCallToActionButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.buttonText,
    this.buttonTextStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              textStyle ??
              Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.grey[400]),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style:
                buttonTextStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary[300],
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
