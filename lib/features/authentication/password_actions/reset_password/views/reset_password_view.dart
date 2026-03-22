import 'package:flutter/material.dart';
import 'package:homz/core/widgets/layout/default_app_padding.dart';
import 'package:homz/features/authentication/password_actions/reset_password/widgets/reset_password_body.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordTextEditingController,
      _confirmPasswordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Reset Password")),
      body: DefaultPadding(
        child: ResetPasswordBody(
          formKey: formKey,
          passwordTextEditingController: _passwordTextEditingController,
          confirmPasswordTextEditingController:
              _confirmPasswordTextEditingController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
  }
}
