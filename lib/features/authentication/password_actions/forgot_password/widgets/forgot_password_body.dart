import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/shared/widgets/buttons/custom_button.dart';
import 'package:homz/core/shared/widgets/forms/custom_form.dart';
import 'package:homz/core/shared/widgets/text_fields/custom_text_form_field.dart';
import 'package:homz/core/utils/app_router.dart';

class ForgotPasswordBody extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController _textEditingController;
  const ForgotPasswordBody({
    super.key,
    required this.formKey,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      formKey: formKey,
      child: Column(
        spacing: 32,
        children: [
          Text(
            "Enter your mobile number to reset your password",
            style: context.bodyMedium,
          ),
          CustomTextFormField.phone(controller: _textEditingController),
          CustomButton.primary(
            text: "Send Code",
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kViewPasswordVerification);
            },
          ),
        ],
      ),
    );
  }
}
