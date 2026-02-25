import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';

class ChangeLocaleButton extends StatelessWidget {
  const ChangeLocaleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEFC3C3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 4.0,
            ),
            child: Text(
              "(عربي)",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppExtraColors.localeButtonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
