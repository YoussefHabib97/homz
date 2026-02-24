import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
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
    _pageController = PageController();
    super.initState();
  }
}
