import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/shared/text_divider.dart';
import 'package:homz/shared/buttons/custom_button.dart';
import 'package:homz/shared/buttons/text_with_call_to_action_button.dart';
import 'package:homz/shared/buttons/third_party_authentication_buttons.dart';
import 'package:homz/shared/forms/custom_form.dart';
import 'package:homz/shared/text_fields/custom_text_form_field.dart';

class SignInViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController _phoneNumberTextEditingController;
  final TextEditingController _passwordTextEditingController;
  const SignInViewBody({
    super.key,
    required this.formKey,
    required TextEditingController phoneNumberTextEditingController,
    required TextEditingController passwordTextEditingController,
  }) : _phoneNumberTextEditingController = phoneNumberTextEditingController,
       _passwordTextEditingController = passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      formKey: formKey,
      child: Column(
        spacing: 32,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFormField.phone(
            controller: _phoneNumberTextEditingController,
          ),
          CustomTextFormField.password(
            controller: _passwordTextEditingController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kViewForgotPassword);
                },
                child: Text(
                  "Forgot Password?",
                  style: context.bodyMedium.copyWith(
                    color: AppColors.primary[300],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          TextWithCallToActionButton(
            text: "Don't have an account?",
            buttonText: "Create an account",
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kViewSignUp);
            },
          ),
          CustomButton.primary(
            text: "Sign In",
            onPressed: () {
              formKey.currentState!.validate();
            },
          ),
          TextDivider(text: 'or continue with'),
          ThirdPartyAuthenticationButtons(),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go(AppRouter.kViewHome);
            },
            child: Text(
              "Skip and start browsing",
              style: context.bodyMedium.copyWith(
                color: AppColors.primary[300],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
