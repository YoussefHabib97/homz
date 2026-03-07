import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/shared/buttons/custom_button.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 24.0,
            ),
            child: Center(
              child: Column(
                spacing: 32,
                children: [
                  SvgPicture.asset(kAlertSuccess),
                  Text(
                    "Congratulations!",
                    style: context.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Your password has been successfully updated",
                    style: context.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kViewHome);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
