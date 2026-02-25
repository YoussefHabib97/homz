import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  late final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Image.asset(kOnboardingImage1, fit: BoxFit.cover),
              Image.asset(kOnboardingImage2, fit: BoxFit.cover),
              Image.asset(kOnboardingImage3, fit: BoxFit.cover),
            ],
            onPageChanged: (value) => setState(() {}),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
}
