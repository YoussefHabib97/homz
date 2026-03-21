import 'package:flutter/material.dart';
import 'package:homz/app/navigation/nav_tab.dart';
import 'package:homz/core/constants/constants.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class AppShell extends StatefulWidget {
  final List<NavTab> tabs;

  const AppShell({super.key, required this.tabs});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _previousIndex = 0;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(_controller);
  }

  void _onTabSelected(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;

      final direction = _currentIndex > _previousIndex ? 1 : -1;
      _slideAnimation = Tween<Offset>(
        begin: Offset(direction.toDouble(), 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHome = _currentIndex == 0;
    final currentTab = widget.tabs[_currentIndex];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          isHome ? kToolbarHeightTall : kToolbarHeight,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isHome ? kToolbarHeightTall : kToolbarHeight,
          child: SlideTransition(
            position: _slideAnimation,
            child: currentTab.appBar,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          final direction = _currentIndex > _previousIndex ? 1 : -1;
          return SlideTransition(
            position: animation.drive(
              Tween(
                begin: Offset(direction.toDouble(), 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeInOut)),
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
        onTap: _onTabSelected,
      ),
    );
  }
}
