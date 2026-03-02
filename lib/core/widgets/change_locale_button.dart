import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';

class ChangeLocaleButton extends StatelessWidget {
  const ChangeLocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors
            .transparent, // Keep the background transparent to see the onboarding image
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFEFC3C3), width: 1),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 4.0,
            ),
            child: Text(
              "(عربي)",
              style: context.bodyMedium.copyWith(
                color: AppExtraColors.localeButtonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
