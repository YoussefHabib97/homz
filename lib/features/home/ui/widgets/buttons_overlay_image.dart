import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/buttons/custom_button.dart';
import 'package:homz/core/widgets/shared/buttons/rounded_button.dart';

class ButtonsOverlayImage extends StatelessWidget {
  final int widgetIndex;
  const ButtonsOverlayImage({super.key, required this.widgetIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient Overlay (Top to Bottom)
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // ignore: deprecated_member_use
                colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        // Favorite Button (Top Right)
        Positioned(
          top: 16.h,
          right: 16.w,
          child: RoundedButton(
            backgroundColor: AppColors.grey[900]!,
            iconPath: kIconFavorite,
            onPressed: () {},
          ),
        ),

        // Bottom Row ("Take a Look" & Share icon)
        Positioned(
          bottom: 12.h,
          left: 15.w,
          child: Row(
            children: [
              // "Take a Look" Button
              SizedBox(
                width: 141.w,
                child: CustomButton(
                  text: 'Take a Look',
                  verticalPadding: 8.h,
                  horizontalPadding: 25.w,
                  onPressed: () {
                    if (widgetIndex == 0) {
                      GoRouter.of(context).push(AppRouter.kViewCommercialLook);
                    }else if(widgetIndex == 1){
                      GoRouter.of(context).push(AppRouter.kViewResidentialLook);
                    }else{
                      GoRouter.of(context).push(AppRouter.kViewShopsLook);
                    }
                    
                  },
                ),
              ),
              HorizontalGap(8.w),
              // Details Button
              RoundedButton(
                backgroundColor: AppColors.primary[500]!,
                iconPath: kIconShare,
                onPressed: () {
                   if (widgetIndex == 0) {
                      GoRouter.of(context).push(AppRouter.kViewCommercialDetails);
                    }else if(widgetIndex == 1){
                      GoRouter.of(context).push(AppRouter.kViewResidentialDetails);
                    }else{
                      GoRouter.of(context).push(AppRouter.kViewShopsDetails);
                    }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
