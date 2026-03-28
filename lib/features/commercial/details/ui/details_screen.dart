import 'package:flutter/material.dart';
import 'package:homz/core/shared/widgets/details_widget/main_details_screen.dart';

class CommercilDetailsScreen extends StatelessWidget {
  final List<String> imagesPath = [
    'assets/images/commercial1.png',
    'assets/images/commercial2.png',
    'assets/images/commercial3.png',
    'assets/images/commercial4.png',
    'assets/images/commercial5.png',
    'assets/images/commercial6.png',
  ];

  CommercilDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainDetailsScreen(
      imagesPath: imagesPath,
      screenNameAppBar: "Office Details",
    );
  }
}
