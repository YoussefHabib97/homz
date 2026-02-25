import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import "package:homz/core/utils/app_router.dart";
import "package:homz/core/widgets/app_default_padding.dart";
import "package:homz/core/widgets/custom_button.dart";
import "package:homz/core/widgets/custom_form.dart";
import "package:homz/core/widgets/custom_text_form_field.dart";

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _textEditingController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Forgot Password")),
      body: AppDefaultPadding(
        child: CustomForm(
          formKey: formKey,
          child: Column(
            spacing: 32,
            children: [
              Text(
                "Enter your mobile number to reset your password",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              CustomTextFormField(
                hintText: "Mobile Number",
                controller: _textEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomButton(
                text: "Send Code",
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kViewPasswordVerification);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }
}
