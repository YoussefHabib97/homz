import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/widgets/shared/buttons/change_locale_button.dart';

class SignInAppBar extends StatelessWidget {
  const SignInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Welcome to"
            "\n"
            "Homz",
            style: context.headlineLarge,
          ),
          ChangeLocaleButton(),
        ],
      ),
    );
  }
}
