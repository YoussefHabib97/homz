import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart' show StringExtension;
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_icon_button.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late bool _isRegisterButtonDisabled = false;
  late TextEditingController _nameTextEditingController,
      _mobileNumberTextEditingController,
      _passwordTextEditingController,
      _confirmPasswordTextEditingController;

  @override
  void initState() {
    super.initState();
    _nameTextEditingController = TextEditingController();
    _mobileNumberTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteractionIfError,
      child: SingleChildScrollView(
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
              CustomTextFormField(
                textInputType: TextInputType.visiblePassword,
                prefixIcon: SvgPicture.asset(
                  kPasswordIcon,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey[400]!,
                    BlendMode.srcATop,
                  ),
                ),
                hintText: "Password",
                isObscured: true,
                textController: _passwordTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
              ),
              CustomTextFormField(
                textInputType: TextInputType.visiblePassword,
                prefixIcon: SvgPicture.asset(
                  kPasswordIcon,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.grey[400]!,
                    BlendMode.srcATop,
                  ),
                ),
                isObscured: true,
                hintText: "Confirm Password",
                textController: _confirmPasswordTextEditingController,
                validator: (value) {
                  return null;
                },
                onSubmit: (value) {},
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
              Row(
                spacing: 8,
                children: [
                  Expanded(child: Divider(color: AppColors.grey[400]!)),
                  Text(
                    "or continue with",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey[400],
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.grey[400]!)),
                ],
              ),
              Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomIconButton(
                      onPressed: () {},
                      child: SvgPicture.asset(kGoogleIcon),
                    ),
                  ),
                  Expanded(
                    child: CustomIconButton(
                      onPressed: () {},
                      child: SvgPicture.asset(kAppleIcon),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
