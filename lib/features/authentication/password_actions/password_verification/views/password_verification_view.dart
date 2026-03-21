import 'package:flutter/material.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';
import 'package:homz/features/authentication/password_actions/password_verification/widgets/password_verification_body.dart';

class PasswordVerificationView extends StatefulWidget {
  const PasswordVerificationView({super.key});

  @override
  State<PasswordVerificationView> createState() =>
      _PasswordVerificationViewState();
}

class _PasswordVerificationViewState extends State<PasswordVerificationView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Verification Code")),
      body: AppDefaultPadding(
        child: PasswordVerificationBody(formKey: formKey),
      ),
    );
  }
}
