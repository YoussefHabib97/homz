import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/look_widget/build_page_view_item.dart';

class CommercialLookScreen extends StatefulWidget {
  const CommercialLookScreen({super.key});
  

  @override
  State<CommercialLookScreen> createState() => _LookScreenState();
}

class _LookScreenState extends State<CommercialLookScreen> {
  late final PageController pageController;
  int currentIndex = 0;
  //will reblace with api data only for testing
  List<String> imagesPath = [
    'assets/images/commercial1.png',
    'assets/images/commercial2.png',
    'assets/images/commercial3.png',
    'assets/images/commercial4.png',
    'assets/images/commercial5.png',
    'assets/images/commercial6.png',
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