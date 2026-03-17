import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/extensions/extensions.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

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
    final tabs = <_NavTab>[
      _NavTab(
        appBar: AppBar(
          title: Text("Home", style: context.headlineLarge),
          actions: [
            IconButton(
              // style: Theme.of(context).iconButtonTheme.style!.copyWith(backgroundColor: AppColors.primary[400]),
              onPressed: () {},
              icon: SvgPicture.asset(kIconNotification),
            ),
          ],
        ),
        body: const Center(child: Text("Home Body")),
      ),
      _NavTab(
        appBar: AppBar(title: const Text("Search")),
        body: const Center(child: Text("Search Body")),
      ),
      _NavTab(
        appBar: AppBar(title: const Text("Saved")),
        body: const Center(child: Text("Saved Body")),
      ),
      _NavTab(
        appBar: AppBar(title: const Text("Messages")),
        body: const MessagesPageView(),
      ),
      _NavTab(
        appBar: AppBar(title: const Text("Profile")),
        body: const ProfilePageView(),
      ),
    ];

    return Scaffold(
      appBar: tabs[currentIndex].appBar,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOutCirc,
        switchOutCurve: Curves.easeInOutCirc,
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

class _NavTab {
  final PreferredSizeWidget appBar;
  final Widget body;

  const _NavTab({required this.appBar, required this.body});
}

class MessagesPageView extends StatelessWidget {
  const MessagesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => GoRouter.of(context).push(AppRouter.kViewChat),
        child: Text("View Messages"),
      ),
    );
  }
}

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => GoRouter.of(context).push(AppRouter.kViewSignIn),
        child: Text("Sign In"),
      ),
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
