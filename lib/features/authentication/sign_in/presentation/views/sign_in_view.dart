import 'package:flutter/material.dart';
import 'package:homz/core/widgets/app_default_padding.dart';
import 'package:homz/features/authentication/sign_in/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _mobileNumberTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDefaultPadding(
        child: SignInViewBody(
          formKey: formKey,
          mobileNumberTextEditingController: _mobileNumberTextEditingController,
          passwordTextEditingController: _passwordTextEditingController,
        ),
      ),
    );
  }
}
