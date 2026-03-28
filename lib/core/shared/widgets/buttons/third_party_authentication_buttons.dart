import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/widgets/buttons/custom_button.dart';

class ThirdPartyAuthenticationButtons extends StatelessWidget {
  const ThirdPartyAuthenticationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
