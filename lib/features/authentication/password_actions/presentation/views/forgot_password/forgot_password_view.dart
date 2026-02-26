import "package:flutter/material.dart";
import "package:homz/core/widgets/app_default_padding.dart";
import "package:homz/features/authentication/password_actions/presentation/views/forgot_password/widgets/forgot_password_body.dart";

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
        child: ForgotPasswordBody(
          formKey: formKey,
          textEditingController: _textEditingController,
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
