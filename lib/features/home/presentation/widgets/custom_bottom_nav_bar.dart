import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/features/home/presentation/widgets/custom_navigation_button.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      (label: "Home", icon: kIconHome),
      (label: "Search", icon: kIconSearch),
      (label: "Saved", icon: kIconHeart),
      (label: "Messages", icon: kIconMessage),
      (label: "Profile", icon: kIconProfile),
    ];

    return SafeArea(
      child: AppDefaultPadding(
        horizontalOffset: 8.h,
        verticalOffset: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            navItems.length,
            (index) => CustomNavigationButton(
              isSelected: currentIndex == index,
              onTap: () => onTap(index),
              iconPath: navItems[index].icon,
              label: navItems[index].label,
            ),
          ),
        ),
      ),
    );
  }
}
