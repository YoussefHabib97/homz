import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:homz/core/widgets/shared/text_divider.dart';
import 'package:homz/shared/buttons/custom_button.dart';
import 'package:homz/shared/buttons/third_party_authentication_buttons.dart';
import 'package:homz/shared/forms/custom_form.dart';
import 'package:homz/shared/text_fields/custom_text_form_field.dart';

class SignUpViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController _nameTextEditingController;
  final TextEditingController _phoneNumberTextEditingController;
  final TextEditingController _passwordTextEditingController;
  final TextEditingController _confirmPasswordTextEditingController;
  const SignUpViewBody({
    super.key,
    required this.formKey,
    required TextEditingController nameTextEditingController,
    required TextEditingController phoneNumberTextEditingController,
    required TextEditingController passwordTextEditingController,
    required TextEditingController confirmPasswordTextEditingController,
  }) : _nameTextEditingController = nameTextEditingController,
       _phoneNumberTextEditingController = phoneNumberTextEditingController,
       _passwordTextEditingController = passwordTextEditingController,
       _confirmPasswordTextEditingController =
           confirmPasswordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      formKey: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 32,
        children: [
          CustomTextFormField.name(controller: _nameTextEditingController),
          CustomTextFormField.phone(
            controller: _phoneNumberTextEditingController,
          ),
          CustomTextFormField.password(
            controller: _passwordTextEditingController,
          ),
          CustomTextFormField.confirmPassword(
            controller: _passwordTextEditingController,
            passwordToMatch: _confirmPasswordTextEditingController,
          ),
          CustomButton.primary(
            text: "Sign Up",
            onPressed: () {
              formKey.currentState!.validate();
            },
          ),
          Gap(16),
          TextDivider(text: 'or continue with'),
          ThirdPartyAuthenticationButtons(),
        ],
      ),
    );
  }
}
