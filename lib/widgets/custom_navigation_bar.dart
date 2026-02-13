import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/theme/app_colors.dart';
import 'package:homz/utils/constants.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: Scaffold(body: Center(child: Text("Home"))),
          item: ItemConfig(
            icon: SvgPicture.asset(kHomeIcon),
            title: "Home",
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: ColorScales.grey[50]),
            iconSize: 24,
            activeForegroundColor: ColorScales.primary[400]!,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
        itemPadding: EdgeInsets.all(10),
        navBarDecoration: NavBarDecoration(
          color: AppColors.background,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
