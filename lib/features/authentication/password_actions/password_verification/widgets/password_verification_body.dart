import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/shared/buttons/text_with_call_to_action_button.dart';
import 'package:homz/shared/forms/custom_form.dart';
import 'package:homz/shared/text_fields/base_text_form_field.dart';

class PasswordVerificationBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const PasswordVerificationBody({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      formKey: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          RichText(
            text: TextSpan(
              text: "Enter the verification code",
              style: context.bodyMedium,
              children: [
                TextSpan(
                  text:
                      "\n"
                      "We have sent a verification code to your number",
                  style: context.bodySmall.copyWith(color: AppColors.grey[400]),
                ),
              ],
            ),
          ),
          // ? TODO: Implement pinput and the SMS Autofill
          BaseTextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(),
          ),
          TextWithCallToActionButton(
            text: "Didn't recieve the code?",
            textStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.grey[50]),
            buttonText: "Resend",
            onPressed: () {
              GoRouter.of(context).go(AppRouter.kViewResetPassword);
            },
          ),
        ],
      ),
    );
  }
}
