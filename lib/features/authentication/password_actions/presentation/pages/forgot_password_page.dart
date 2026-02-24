import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';
import "package:homz/core/utils/app_router.dart";
import "package:homz/core/widgets/app_padding.dart";
import "package:homz/core/widgets/custom_button.dart";
import "package:homz/core/widgets/custom_form.dart";
import "package:homz/core/widgets/custom_text_form_field.dart";

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _textEditingController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Forgot Password")),
      body: AppPadding(
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
                textInputType: TextInputType.numberWithOptions(),
                textController: _textEditingController,
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
                  ).push(AppRouter.kPagePasswordVerification);
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
