import 'package:flutter/material.dart';
import 'package:homz/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
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
          color: onPressed != null
              ? (isPrimary ? ColorScales.primary[500] : ColorScales.grey[900])
              : isPrimary
              ? ColorScales.primary[800]
              : ColorScales.grey[900],
          border: onPressed != null
              ? (isPrimary
                    ? null
                    : Border.all(color: ColorScales.grey[50]!, width: 1))
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
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          )
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorScales.grey[50],
                          ))
                  : isPrimary
                  ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorScales.grey[600],
                    )
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorScales.grey[600],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
