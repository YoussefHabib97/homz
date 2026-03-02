import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/features/onboarding/presentation/views/widgets/onboarding_page_view_item.dart.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  late final PageController pageController;
  //page view data
  List<OnboardingPageModel> onboardingData = [
    OnboardingPageModel(
      title:
          'Explore Amazing'
          '\n'
          'Real Estate',
      description:
          'Find what you'
          '\n'
          'want',
      image: kOnboardingImage1,
    ),
    OnboardingPageModel(
      title:
          'Compare and'
          '\n'
          'choose',
      description:
          'Find what you'
          '\n'
          'want',
      image: kOnboardingImage2,
    ),
    OnboardingPageModel(
      title:
          'Choose the'
          '\n'
          'most comfortable',
      description:
          'Find what you'
          '\n'
          'want',
      image: kOnboardingImage3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => OnboardingPageViewItem(
          model: onboardingData[index],
          index: index,
          pageController: pageController,
        ),
        itemCount: onboardingData.length,
        controller: pageController,
        onPageChanged: (index) {},
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String image;

  OnboardingPageModel({
    required this.title,
    this.description = '',
    required this.image,
  });
}
