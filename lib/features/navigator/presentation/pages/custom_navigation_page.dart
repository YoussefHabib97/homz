import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/custom_navigation_button.dart';

class CustomNavigationPage extends StatefulWidget {
  const CustomNavigationPage({super.key});

  @override
  State<CustomNavigationPage> createState() => _CustomNavigationPageState();
}

class _CustomNavigationPageState extends State<CustomNavigationPage> {
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

  PreferredSizeWidget _getAppBar() => appBars[currentIndex];

  Widget _getBody() => IndexedStack(index: currentIndex, children: pages);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildCustomNavigationBar(),
        ),
      ),
    );
  }
}
