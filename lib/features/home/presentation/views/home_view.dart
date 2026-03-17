import 'package:flutter/material.dart';
import 'package:homz/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int previousIndex = 0;
  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text("Home Body")),
    Center(child: Text("Search Body")),
    Center(child: Text("Saved Body")),
    Center(child: Text("Messages Body")),
    Center(child: Text("Profile Body")),
  ];

  final List<PreferredSizeWidget> appBars = [
    AppBar(title: const Text("Home")),
    AppBar(title: const Text("Search")),
    AppBar(title: const Text("Saved")),
    AppBar(title: const Text("Messages")),
    AppBar(title: const Text("Profile")),
  ];

  void _onTabTapped(int index) {
    if (currentIndex == index) return;
    setState(() {
      previousIndex = currentIndex;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[currentIndex],
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
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
          child: pages[currentIndex],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
