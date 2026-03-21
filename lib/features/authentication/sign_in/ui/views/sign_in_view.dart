import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/widgets/common/default_app_bar.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';
import 'package:homz/features/authentication/sign_in/ui/widgets/sign_in_view_body.dart';
import 'package:homz/shared/buttons/change_locale_button.dart';

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
      appBar: AppDefaultAppBar(
        title: Text(
          "Welcome to"
          "\n"
          "Homz",
          style: context.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          AppDefaultPadding(
            verticalOffset: 0,
            horizontalOffset: 8,
            child: ChangeLocaleButton(),
          ),
        ],
        toolbarHeight: kToolbarHeightTall,
      ),
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
