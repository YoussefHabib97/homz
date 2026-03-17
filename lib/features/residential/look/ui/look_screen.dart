import 'package:flutter/material.dart';
import 'package:homz/features/residential/look/ui/widgets/build_page_view_item.dart';

class LookScreen extends StatefulWidget {
  const LookScreen({super.key});

  @override
  State<LookScreen> createState() => _LookScreenState();
}

class _LookScreenState extends State<LookScreen> {
  late final PageController pageController;
  int currentIndex = 0;
  //will reblace with api data only for testing
  List<String> imagesPath = [
    'assets/images/res1.png',
    'assets/images/res2.png',
    'assets/images/res3.png',
    'assets/images/res4.png',
    'assets/images/res5.png',
    'assets/images/res6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => BuildPageViewItem(
          imagesPath: imagesPath[index],
          currentIndex: currentIndex,
        ),
        controller: pageController,
        itemCount: 6,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
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
    pageController = PageController();
    super.initState();
  }
}
