import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/app/navigation/nav_tab.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/widgets/shared/default_app_bar.dart';
import 'package:homz/features/home/ui/views/messages_view_tab.dart';
import 'package:homz/features/home/ui/views/search_view_tab.dart';
import 'package:homz/features/home/ui/widgets/home_tab.dart';
import 'package:homz/features/profile/ui/views/profile_page_view.dart';
import 'package:homz/features/saved/ui/views/saved_view.dart';

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
        body: const SearchViewTab(),
      ),
      NavTab(
        appBar: const AppDefaultAppBar(title: Text("Saved"), centerTitle: true),
        body: SavedView(),
      ),
      NavTab(
        appBar: const AppDefaultAppBar(title: Text("Messages")),
        body: const MessagesViewTab(),
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
