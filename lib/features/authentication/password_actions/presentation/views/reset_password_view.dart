import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/app_default_padding.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/features/authentication/password_actions/presentation/widgets/success_alert_dialog.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Reset Password")),
      body: AppDefaultPadding(
        child: CustomForm(
          formKey: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              RichText(
                text: TextSpan(
                  text: "Enter a new password",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text:
                          "\n"
                          "Your new password must be strong",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextFormField(
                hintText: "New Password",
                controller: TextEditingController(),
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomTextFormField(
                hintText: "Confirm New Password",
                controller: TextEditingController(),
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomButton(
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
        ),
      ),
    );
  }
}
