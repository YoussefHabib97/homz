import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/default_app_bar.dart';
import 'package:homz/core/widgets/shared/text_form_fields/custom_text_form_field.dart';
import 'package:homz/features/home/ui/widgets/home_body.dart';
import 'package:homz/features/navigator/presentation/custom_bottom_nav_bar.dart';
import 'package:homz/features/navigator/presentation/widgets/custom_navigation_button.dart';
import 'package:homz/features/navigator/presentation/widgets/unpopulated_nav_tab.dart';
import 'package:homz/features/profile/ui/profile_page_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int previousIndex = 0;
  int currentIndex = 0;

  void _onTabTapped(int index) {
    if (currentIndex == index) return;
    setState(() {
      previousIndex = currentIndex;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = <NavTab>[
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
        body: HomeBody(),
      ),
      NavTab(
        appBar: AppDefaultAppBar(
          title: const Text("Search"),
          centerTitle: true,
        ),
        body: AppDefaultPadding(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFormField.search(
                controller: TextEditingController(),
                onFilterTap: () {},
              ),
              UnpopulatedNavTabBody(
                imagePath: kImageSearchIllustration,
                title: "No results found",
                subtitle: "Please try again",
              ),
            ],
          ),
        ),
      ),
      NavTab(
        appBar: AppDefaultAppBar(title: const Text("Saved"), centerTitle: true),
        body: UnpopulatedNavTabBody(
          imagePath: kImageSavedIllustration,
          title: "Nothing here!",
          subtitle: "You don't have any places saved yet",
        ),
      ),
      NavTab(
        appBar: AppDefaultAppBar(title: const Text("Messages")),
        body: const MessagesViewBody(),
      ),
      NavTab(
        appBar: AppDefaultAppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
        body: const ProfileViewBody(),
      ),
    ];

    return Scaffold(
      appBar: tabs[currentIndex].appBar,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.bounceIn,
        // switchOutCurve: Curves.easeInOutCirc,
        transitionBuilder: (child, animation) {
          final direction = currentIndex > previousIndex ? 1 : -1;
          final offsetAnimation = animation.drive(
            Tween<Offset>(
              begin: Offset(direction.toDouble(), 0),
              end: Offset.zero,
            ),
          );
          return SlideTransition(position: offsetAnimation, child: child);
        },
        child: SizedBox(
          key: ValueKey<int>(currentIndex),
          child: tabs[currentIndex].body,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return UnpopulatedNavTabBody(
      imagePath: kImageMessagesInboxIllustration,
      title: "Inbox empty",
      subtitle:
          "You have no messages yet.\nBe the first to start a conversation",
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homz"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              kIconNotification,
              colorFilter: ColorFilter.mode(
                AppColors.grey[50]!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
