import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart' show StringExtension;
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';
import 'package:homz/core/widgets/password_text_form_field.dart';
import 'package:homz/core/widgets/third_party_authentication_buttons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late bool _isRegisterButtonDisabled = false;
  late TextEditingController _nameTextEditingController,
      _mobileNumberTextEditingController,
      _passwordTextEditingController,
      _confirmPasswordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteractionIfError,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
                textInputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textController: _nameTextEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.isValidName) {
                    return "Please enter a valid name";
                  }
                  return null;
                },
                onSubmit: (value) {
                  _nameTextEditingController.text = value
                      .trim()
                      .capitalizeEach();
                },
              ),
              CustomTextFormField(
                textInputType: TextInputType.phone,
                prefixIcon: SvgPicture.asset(
                  kMobileNumberIcon,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey[400]!,
                    BlendMode.srcATop,
                  ),
                ),
                hintText: "Mobile Number",
                textController: _mobileNumberTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              PasswordTextFormField(
                passwordTextEditingController: _passwordTextEditingController,
              ),
              PasswordTextFormField(
                isConfirmField: true,
                passwordTextEditingController:
                    _confirmPasswordTextEditingController,
              ),
              CustomButton(
                onPressed: _isRegisterButtonDisabled
                    ? null
                    : () {
                        bool isValidated = false;
                        setState(() {
                          isValidated = _formKey.currentState!.validate();
                        });
                        if (isValidated) {
                          setState(() {
                            _isRegisterButtonDisabled = true;
                          });
                        }
                      },
                text: "Sign Up",
              ),
              SizedBox(height: 32),
              ThirdPartyAuthenticationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
    _mobileNumberTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
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
