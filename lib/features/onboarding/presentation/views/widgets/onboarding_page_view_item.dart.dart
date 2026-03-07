import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/change_locale_button.dart';
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/features/onboarding/presentation/views/onboarding_view.dart';

class OnboardingPageViewItem extends StatelessWidget {
  final OnboardingPageModel model;
  final int index;
  final PageController pageController;
  const OnboardingPageViewItem({
    super.key,
    required this.model,
    required this.index,
    required this.pageController,
  });

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
          child: AppDefaultPadding(
            horizontalOffset: 16,
            verticalOffset: 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: context.headlineLarge),
                VerticalGap(4),
                Row(
                  children: [
                    Text(
                      model.description,
                      style: context.bodyLarge,
                      // AppTextStyles.font16Blue50Regular.copyWith(
                      //   height: 1.3.h,
                      // ),
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
                          color: AppColors.grey[50]!,
                          size: 24.sp,
                        ),
                      ),
                  ],
                ),
                if (index == 2)
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h),
                    child: CustomButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kViewSignIn);
                      },
                      text: "Get Started",
                    ),
                  ),
              ],
            ),
          ),
        ),
        Positioned(top: 70.h, right: 12.w, child: ChangeLocaleButton()),
      ],
    );
  }
}
