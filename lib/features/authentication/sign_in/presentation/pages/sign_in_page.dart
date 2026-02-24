import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/app_padding.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/core/widgets/text_with_call_to_action_button.dart';
import 'package:homz/core/widgets/third_party_authentication_buttons.dart';
import 'package:homz/features/authentication/sign_in/presentation/widgets/custom_sign_in_app_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _mobileNumberTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPadding(
        child: CustomForm(
          formKey: formKey,
          child: Column(
            spacing: 32,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSignInAppBar(),
              CustomTextFormField(
                hintText: "Phone Number",
                textInputType: TextInputType.number,
                textController: _mobileNumberTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomTextFormField(
                isPasswordTextFormField: true,
                textInputType: TextInputType.visiblePassword,
                hintText: "Password",
                textController: _passwordTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kPageForgotPassword);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                  GoRouter.of(context).push(AppRouter.kPageSignUp);
                },
              ),
              CustomButton(text: "Sign In", isPrimary: false, onPressed: () {}),
              ThirdPartyAuthenticationButtons(),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kPageHome);
                },
                child: Text(
                  "Skip and start browsing",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary[300],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
