import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/buttons/custom_button.dart';

class ThirdPartyAuthenticationButtons extends StatelessWidget {
  const ThirdPartyAuthenticationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(child: Divider(color: AppColors.grey[400]!)),
            Text(
              "or continue with",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey[400]),
            ),
            Expanded(child: Divider(color: AppColors.grey[400]!)),
          ],
        ),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomButton.icon(
                icon: SvgPicture.asset(kIconGoogle),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: CustomButton.icon(
                icon: SvgPicture.asset(kIconApple),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
