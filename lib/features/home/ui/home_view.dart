import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/features/home/ui/navigation_tabs.dart';
import 'package:homz/features/navigator/presentation/custom_bottom_nav_bar.dart';
import 'package:homz/features/navigator/presentation/widgets/custom_navigation_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _previousIndex = 0;
  int _currentIndex = 0;

  late final List<NavTab> _tabs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabs = NavTabs.build(context);
  }

  void _onTabTapped(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isHome = _currentIndex == 0;
    final currentTab = _tabs[_currentIndex];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          isHome ? kToolbarHeightTall : kToolbarHeight,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          height: isHome ? kToolbarHeightTall : kToolbarHeight,
          child: currentTab.appBar,
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) {
          final direction = _currentIndex > _previousIndex ? 1 : -1;
          return SlideTransition(
            position: animation.drive(
              Tween(begin: Offset(direction.toDouble(), 0), end: Offset.zero),
            ),
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: currentTab.body,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
