import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool isConfirmField;
  final TextEditingController _passwordTextEditingController;

  const PasswordTextFormField({
    super.key,
    required TextEditingController passwordTextEditingController,
    this.isConfirmField = false,
  }) : _passwordTextEditingController = passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.visiblePassword,
      prefixIcon: SvgPicture.asset(
        kPasswordIcon,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(AppColors.grey[400]!, BlendMode.srcATop),
      ),
      hintText: isConfirmField ? "Confirm Password" : "Password",
      isObscured: true,
      textController: _passwordTextEditingController,
      validator: (value) {
        return null;
      },
      onSubmit: (value) {},
    );
  }
}
