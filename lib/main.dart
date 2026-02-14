import 'package:flutter/material.dart';
import 'package:homz/pages/custom_navigation_page.dart';
import 'package:homz/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: buildAppTheme(),
      home: CustomNavigationPage(),
    );
  }
}
