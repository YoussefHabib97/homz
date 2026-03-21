import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/widgets/common/default_app_bar.dart';
import 'package:homz/features/home/ui/views/messages_view_body.dart';
import 'package:homz/features/home/ui/views/search_view_body.dart';
import 'package:homz/features/home/ui/widgets/home_body.dart';
import 'package:homz/features/navigator/ui/widgets/custom_navigation_button.dart';
import 'package:homz/features/navigator/ui/widgets/unpopulated_nav_tab.dart';
import 'package:homz/features/profile/ui/profile_page_view.dart';

class NavTabs {
  static List<NavTab> build(BuildContext context) {
    return [
      NavTab(
        appBar: AppDefaultAppBar(
          toolbarHeight: kToolbarHeightTall,
          title: Text("Home", style: context.headlineLarge),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(kIconNotification, width: 24),
            ),
          ],
        ),
        body: const HomeBody(),
      ),
      NavTab(
        appBar: const AppDefaultAppBar(
          title: Text("Search"),
          centerTitle: true,
        ),
        body: const SearchViewBody(),
      ),
      NavTab(
        appBar: const AppDefaultAppBar(title: Text("Saved"), centerTitle: true),
        body: const UnpopulatedNavTabBody(
          imagePath: kImageSavedIllustration,
          title: "Nothing here!",
          subtitle: "You don't have any places saved yet",
        ),
      ),
      NavTab(
        appBar: const AppDefaultAppBar(title: Text("Messages")),
        body: const MessagesViewBody(),
      ),
      NavTab(
        appBar: const AppDefaultAppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: const ProfileViewBody(),
      ),
    ];
  }
}
