import 'package:flutter/material.dart';
import 'package:homz/core/shared/widgets/details_widget/main_details_screen.dart';

class ShopDetailsScreen extends StatelessWidget {
  final List<String> imagesPath = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
    'assets/images/shop6.png',
  ];

  ShopDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainDetailsScreen(
      imagesPath: imagesPath,
      screenNameAppBar: "Shop Details",
    );
  }
}
