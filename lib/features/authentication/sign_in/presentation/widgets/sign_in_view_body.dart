import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/text_with_call_to_action_button.dart';
import 'package:homz/core/widgets/third_party_authentication_buttons.dart';
import 'package:homz/features/authentication/sign_in/presentation/widgets/sign_in_app_bar.dart';
import 'package:homz/features/shared/password_text_form_field.dart';
import 'package:homz/features/shared/phone_text_form_field.dart';

class SignInViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController _mobileNumberTextEditingController;
  final TextEditingController _passwordTextEditingController;
  const SignInViewBody({
    super.key,
    required this.formKey,
    required TextEditingController mobileNumberTextEditingController,
    required TextEditingController passwordTextEditingController,
  }) : _mobileNumberTextEditingController = mobileNumberTextEditingController,
       _passwordTextEditingController = passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      formKey: formKey,
      child: Column(
        spacing: 32,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SignInAppBar(),
          PhoneNumberTextFormField(
            controller: _mobileNumberTextEditingController,
          ),
          PasswordTextFormField(controller: _passwordTextEditingController),
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
          CustomButton.secondary(
            text: "Sign In",
            onPressed: () {
              formKey.currentState!.validate();
            },
          ),
          ThirdPartyAuthenticationButtons(),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kViewHome);
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
