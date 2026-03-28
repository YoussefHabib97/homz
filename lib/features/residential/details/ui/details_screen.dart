import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/details_widget/main_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  final List<String> imagesPath = [
    'assets/images/res1.png',
    'assets/images/res2.png',
    'assets/images/res3.png',
    'assets/images/res4.png',
    'assets/images/res5.png',
    'assets/images/res6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MainDetailsScreen(
      imagesPath: imagesPath,
      screenNameAppBar: "Appartment Details",
    );
  }
}
