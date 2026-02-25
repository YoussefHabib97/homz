import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/app_default_padding.dart';
import 'package:homz/core/widgets/custom_navigation_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Center(child: Text("Home Body Placeholder")),
    Center(child: Text("Search Body Placeholder")),
    Center(child: Text("Saved Body Placeholder")),
    Center(child: Text("Messages Body Placeholder")),
    Center(child: Text("Profile Body Placeholder")),
  ];

  final List<PreferredSizeWidget> appBars = [
    AppBar(title: Text("Home AppBar Placeholder")),
    AppBar(title: Text("Search AppBar Placeholder")),
    AppBar(title: Text("Saved AppBar Placeholder")),
    AppBar(title: Text("Messages AppBar Placeholder")),
    AppBar(title: Text("Profile AppBar Placeholder")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: SafeArea(
        child: AppDefaultPadding(
          horizontalOffset: 8,
          verticalOffset: 0,
          child: _buildCustomNavigationBar(),
        ),
      ),
    );
  }

  Row _buildCustomNavigationBar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomNavigationButton(
        label: "Home",
        iconPath: kHomeIcon,
        isSelected: currentIndex == 0,
        onTap: () => setState(() => currentIndex = 0),
      ),
      CustomNavigationButton(
        label: "Search",
        iconPath: kSearchIcon,
        isSelected: currentIndex == 1,
        onTap: () => setState(() => currentIndex = 1),
      ),
      CustomNavigationButton(
        label: "Saved",
        iconPath: kHeartIcon,
        isSelected: currentIndex == 2,
        onTap: () => setState(() => currentIndex = 2),
      ),
      CustomNavigationButton(
        label: "Messages",
        iconPath: kMessageIcon,
        isSelected: currentIndex == 3,
        onTap: () => setState(() => currentIndex = 3),
      ),
      CustomNavigationButton(
        label: "Profile",
        iconPath: kProfileIcon,
        isSelected: currentIndex == 4,
        onTap: () => setState(() => currentIndex = 4),
      ),
    ],
  );

  PreferredSizeWidget _getAppBar() => appBars[currentIndex];

  Widget _getBody() => IndexedStack(index: currentIndex, children: pages);
}
