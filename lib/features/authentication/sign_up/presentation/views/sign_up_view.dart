import 'package:flutter/material.dart';
import 'package:homz/core/widgets/app_padding_and_gaps.dart';
import 'package:homz/features/authentication/sign_up/presentation/widgets/sign_up_body.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _nameTextEditingController,
      _mobileNumberTextEditingController,
      _passwordTextEditingController,
      _confirmPasswordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Create an account")),
      body: AppDefaultPadding(
        child: SignUpViewBody(
          formKey: formKey,
          nameTextEditingController: _nameTextEditingController,
          mobileNumberTextEditingController: _mobileNumberTextEditingController,
          passwordTextEditingController: _passwordTextEditingController,
          confirmPasswordTextEditingController:
              _confirmPasswordTextEditingController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _mobileNumberTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameTextEditingController = TextEditingController();
    _mobileNumberTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
  }
}
