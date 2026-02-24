import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/core/widgets/dynamic_scaffold.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicScaffold(
      appBar: AppBar(centerTitle: true, title: Text("Reset Password")),
      body: CustomForm(
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
                    text: "\nYour new password must be strong",
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
              textController: TextEditingController(),
              validator: (value) {
                return null;
              },
              onSubmit: (value) {},
            ),
            CustomTextFormField(
              hintText: "Confirm Password",
              textController: TextEditingController(),
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
                  builder: (context) => AlertDialog(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 24.0,
                        ),
                        child: Center(
                          child: Column(
                            spacing: 32,
                            children: [
                              SvgPicture.asset(kAlertSuccess),
                              Text(
                                "Congratulations!",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Your password has been successfully updated",
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              CustomButton(
                                text: "Continue",
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
