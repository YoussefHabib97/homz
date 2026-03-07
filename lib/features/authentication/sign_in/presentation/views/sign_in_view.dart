import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/features/authentication/sign_in/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _phoneNumberTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDefaultPadding(
        child: SignInViewBody(
          formKey: formKey,
          phoneNumberTextEditingController: _phoneNumberTextEditingController,
          passwordTextEditingController: _passwordTextEditingController,
        ),
      ),
    );
  }
}
