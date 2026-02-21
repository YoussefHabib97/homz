import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/core/widgets/third_party_authentication_buttons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _mobileNumberTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomForm(
        child: Column(
          spacing: 32,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              hintText: "Password",
              isObscured: true,
              textInputType: TextInputType.visiblePassword,
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
                  onPressed: () {},
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.grey[400]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primary[300],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            CustomButton(onPressed: () {}, text: "Sign In", isPrimary: false),
            ThirdPartyAuthenticationButtons(),
            TextButton(
              onPressed: () {},
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
    );
  }
}
