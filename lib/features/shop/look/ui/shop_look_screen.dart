import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/look_widget/build_page_view_item.dart';

class ShopLookScreen extends StatefulWidget {
  const ShopLookScreen({super.key});
  

  @override
  State<ShopLookScreen> createState() => _LookScreenState();
}

class _LookScreenState extends State<ShopLookScreen> {
  late final PageController pageController;
  int currentIndex = 0;
  //will reblace with api data only for testing
  List<String> imagesPath = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
    'assets/images/shop6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder:   (context, index)=> BuildPageViewItem(imagesPath: imagesPath[index], currentIndex: currentIndex,),
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