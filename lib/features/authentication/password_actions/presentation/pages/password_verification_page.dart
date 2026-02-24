import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/app_padding.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/core/widgets/text_with_call_to_action_button.dart';

class PasswordVerificationPage extends StatefulWidget {
  const PasswordVerificationPage({super.key});

  @override
  State<PasswordVerificationPage> createState() =>
      _PasswordVerificationPageState();
}

class _PasswordVerificationPageState extends State<PasswordVerificationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Verification Code")),
      body: AppPadding(
        child: CustomForm(
          formKey: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              RichText(
                text: TextSpan(
                  text: "Enter the verification code",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text:
                          "\n"
                          "We have sent a verification code to your number",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextFormField(
                hintText:
                    "To be replaced with divided TextFormField for SMS Verification",
                textController: TextEditingController(),
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              TextWithCallToActionButton(
                text: "Didn't recieve the code?",
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.grey[50]),
                buttonText: "Resend",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kPageResetPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
