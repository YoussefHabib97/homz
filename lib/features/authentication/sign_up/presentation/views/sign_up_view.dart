import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart' show StringExtension;
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/app_default_padding.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_form.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/core/widgets/third_party_authentication_buttons.dart';

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
        child: CustomForm(
          formKey: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 32,
            children: [
              CustomTextFormField(
                prefixIcon: SvgPicture.asset(
                  kUserIcon,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey[400]!,
                    BlendMode.srcATop,
                  ),
                ),
                hintText: "Name",
                controller: _nameTextEditingController,
                validator: (value) {
                  // if (value == null || value.isEmpty || !value.isValidName) {
                  //   return "Please enter a valid name";
                  // }
                  return null;
                },
                onSubmit: (value) {
                  _nameTextEditingController.text = value
                      .trim()
                      .capitalizeEach();
                },
              ),
              CustomTextFormField(
                prefixIcon: SvgPicture.asset(
                  kMobileNumberIcon,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey[400]!,
                    BlendMode.srcATop,
                  ),
                ),
                hintText: "Mobile Number",
                controller: _mobileNumberTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomTextFormField(
                isPassword: true,
                hintText: "Password",
                controller: _passwordTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomTextFormField(
                isPassword: true,
                hintText: "Confirm Password",
                controller: _confirmPasswordTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  setState(() {
                    formKey.currentState!.validate();
                  });
                },
              ),
              SizedBox(height: 16.0),
              ThirdPartyAuthenticationButtons(),
            ],
          ),
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
