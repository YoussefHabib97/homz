import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/buttons/custom_button.dart';
import 'package:homz/core/widgets/shared/custom_form.dart';
import 'package:homz/core/widgets/shared/text_form_fields/custom_text_form_field.dart';
import 'package:homz/features/authentication/password_actions/presentation/views/reset_password/widgets/success_alert_dialog.dart';

class ResetPasswordBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController _passwordTextEditingController;
  final TextEditingController _confirmPasswordTextEditingController;
  const ResetPasswordBody({
    super.key,
    required this.formKey,
    required TextEditingController passwordTextEditingController,
    required TextEditingController confirmPasswordTextEditingController,
  }) : _passwordTextEditingController = passwordTextEditingController,
       _confirmPasswordTextEditingController =
           confirmPasswordTextEditingController;

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
              text: "Enter a new password",
              style: context.bodyMedium,
              children: [
                TextSpan(
                  text:
                      "\n"
                      "Your new password must be strong",
                  style: context.bodySmall.copyWith(color: AppColors.grey[400]),
                ),
              ],
            ),
          ),
          CustomTextFormField.password(
            controller: _passwordTextEditingController,
          ),
          CustomTextFormField.confirmPassword(
            controller: _passwordTextEditingController,
            passwordToMatch: _confirmPasswordTextEditingController,
          ),
          CustomButton.primary(
            text: "Reset Password",
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => SuccessAlertDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
