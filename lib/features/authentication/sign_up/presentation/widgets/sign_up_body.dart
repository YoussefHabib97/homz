import 'package:flutter/material.dart';
import 'package:homz/core/widgets/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/third_party_authentication_buttons.dart';
import 'package:homz/features/shared/name_text_form_field.dart';
import 'package:homz/features/shared/password_text_form_field.dart';
import 'package:homz/features/shared/phone_text_form_field.dart';

class SignUpViewBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController _nameTextEditingController;
  final TextEditingController _mobileNumberTextEditingController;
  final TextEditingController _passwordTextEditingController;
  final TextEditingController _confirmPasswordTextEditingController;
  const SignUpViewBody({
    super.key,
    required this.formKey,
    required TextEditingController nameTextEditingController,
    required TextEditingController mobileNumberTextEditingController,
    required TextEditingController passwordTextEditingController,
    required TextEditingController confirmPasswordTextEditingController,
  }) : _nameTextEditingController = nameTextEditingController,
       _mobileNumberTextEditingController = mobileNumberTextEditingController,
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
          NameTextFormField(controller: _nameTextEditingController),
          PhoneNumberTextFormField(
            controller: _mobileNumberTextEditingController,
          ),
          PasswordTextFormField(controller: _passwordTextEditingController),
          PasswordTextFormField(
            type: PasswordFieldType.confirm,
            controller: _confirmPasswordTextEditingController,
          ),
          CustomButton(
            text: "Sign Up",
            onPressed: () {
              formKey.currentState!.validate();
            },
          ),
          VerticalGap(16),
          ThirdPartyAuthenticationButtons(),
        ],
      ),
    );
  }
}
