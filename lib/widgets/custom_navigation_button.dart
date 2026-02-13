import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/theme/app_colors.dart';

class CustomNavigationButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String iconPath;
  final String label;
  const CustomNavigationButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Ink(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(27),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(27),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      iconPath,
                      colorFilter: ColorFilter.mode(
                        ColorScales.grey[50]!,
                        BlendMode.srcATop,
                      ),
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Ink(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(27)),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(27),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(
                    ColorScales.grey[400]!,
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
          );
  }
}
