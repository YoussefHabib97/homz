import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/features/onboarding/presentation/views/page_view_tem.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  late final PageController pageController;
  //page view data
    List<OnboardingModel> onboardingData = [
      OnboardingModel(
        title: 'Explore Amazing\nReal Estate',
        description: 'Find what you\nwant',
        image: kOnboardingImage1,
      ),
      OnboardingModel(
        title: 'Compare and\nchoose',
        description: 'Find what you\nwant',
        image: kOnboardingImage2,
      ),
      OnboardingModel(
        title: 'choose the\nmore comfort',
         description: 'Find what you\nwant',
        image: kOnboardingImage3,
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => PageViewTem(
          model: onboardingData[index],
          index: index,
          pageController: pageController,
        ),
        itemCount: 3,
        controller: pageController,
        onPageChanged: (index) {
            
        },
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

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}
