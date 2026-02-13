import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/theme/app_colors.dart';
import 'package:homz/theme/app_theme.dart';
import 'package:homz/utils/constants.dart';
import 'package:homz/widgets/custom_button.dart';
import 'package:homz/widgets/custom_icon_button.dart';
import 'package:homz/widgets/custom_text_form_field.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: buildAppTheme(),
      home: TestingWidget(),
    );
  }
}

class TestingWidget extends StatefulWidget {
  const TestingWidget({super.key});

  @override
  State<TestingWidget> createState() => _TestingWidgetState();
}

class _TestingWidgetState extends State<TestingWidget> {
  int currentIndex = 0;

  final List<Widget> pages = [
    RegisterPage(),
    Center(child: Text("Search")),
    Center(child: Text("Saved")),
    Center(child: Text("Messages")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an Account"),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: pages[currentIndex],
      //   bottomNavigationBar: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           CustomNavigationButton(
      //             label: "Home",
      //             iconPath: kHomeIcon,
      //             isSelected: currentIndex == 0,
      //             onTap: () => setState(() => currentIndex = 0),
      //           ),
      //           CustomNavigationButton(
      //             label: "Search",
      //             iconPath: kSearchIcon,
      //             isSelected: currentIndex == 1,
      //             onTap: () => setState(() => currentIndex = 1),
      //           ),
      //           CustomNavigationButton(
      //             label: "Saved",
      //             iconPath: kHeartIcon,
      //             isSelected: currentIndex == 2,
      //             onTap: () => setState(() => currentIndex = 2),
      //           ),
      //           CustomNavigationButton(
      //             label: "Messages",
      //             iconPath: kMessageIcon,
      //             isSelected: currentIndex == 3,
      //             onTap: () => setState(() => currentIndex = 3),
      //           ),
      //           CustomNavigationButton(
      //             label: "Profile",
      //             iconPath: kProfileIcon,
      //             isSelected: currentIndex == 4,
      //             onTap: () => setState(() => currentIndex = 4),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 32,
          children: [
            CustomTextFormField(
              prefixIcon: SvgPicture.asset(
                kUserIcon,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  ColorScales.grey[400]!,
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
                  ColorScales.grey[400]!,
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
                  ColorScales.grey[400]!,
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
                  ColorScales.grey[400]!,
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
                Expanded(child: Divider(color: ColorScales.grey[400]!)),
                Text(
                  "or continue with",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorScales.grey[400],
                  ),
                ),
                Expanded(child: Divider(color: ColorScales.grey[400]!)),
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
