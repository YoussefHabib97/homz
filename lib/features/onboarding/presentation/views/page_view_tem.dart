import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/routing/routes.dart';
import 'package:homz/core/theme/text_theme.dart';
import 'package:homz/core/utils/spacing.dart';
import 'package:homz/core/widgets/change_locale_button.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/features/onboarding/presentation/views/onboarding_view.dart';

class PageViewTem extends StatelessWidget {
  final OnboardingModel model;
  final int index;
  final PageController pageController;
  const PageViewTem({super.key, required this.model, required this.index, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          model.image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        // add header and description at the bottom of the page
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 40.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: AppTextStyles.font32Gray50Bold.copyWith(height: 1.h),
                ),
                verticalSpace(5),
                Row(
                  children: [
                    Text(
                      model.description,
                      style: AppTextStyles.font16Blue50Regular.copyWith(
                        height: 1.3.h,
                      ),
                    ),
                    const Spacer(),
                    if (index != 2)
                      IconButton(
                        onPressed: () {
                          // move to the next page in the page view
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                  ],
                ),
                if(index == 2)
                Padding(
                  padding:  EdgeInsets.only(top: 8.0.h),
                  child: CustomButton(
                    onPressed:   () {
                      Navigator.pushNamed(context, Routes.signInScreen);
                    }, text: "Get Started",
                    isPrimary: true,
                    ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 58.h,
          right: 16.w,
          child: ChangeLocaleButton(),
           ),
        
      ],
    );
  }
}
