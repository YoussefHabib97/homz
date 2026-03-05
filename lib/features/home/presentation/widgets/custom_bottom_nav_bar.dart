import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/app_padding_and_gaps.dart';
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
      (label: "Home", icon: kHomeIcon),
      (label: "Search", icon: kSearchIcon),
      (label: "Saved", icon: kHeartIcon),
      (label: "Messages", icon: kMessageIcon),
      (label: "Profile", icon: kProfileIcon),
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
