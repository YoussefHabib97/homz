import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_icon_button.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              textController: TextEditingController(),
              validator: (value) {
                return null;
              },
              onSaved: (value) {},
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
              textController: TextEditingController(),
              validator: (value) {
                return null;
              },
              onSaved: (value) {},
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
              textController: TextEditingController(),
              validator: (value) {
                return null;
              },
              onSaved: (value) {},
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
              textController: TextEditingController(),
              validator: (value) {
                return null;
              },
              onSaved: (value) {},
            ),
            CustomButton(onPressed: () {}, text: "Sign Up"),
            SizedBox(height: 32),
            Row(
              spacing: 8,
              children: [
                Expanded(child: Divider(color: AppColors.grey[400]!)),
                Text(
                  "or continue with",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.grey[400]),
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
    );
  }
}
