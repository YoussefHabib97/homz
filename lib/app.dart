import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_theme.dart';
import 'package:homz/features/authentication/sign_up/presentation/pages/sign_up_page.dart';

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: AppTheme.dark,
      home: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SignUpPage(),
      ),
    );
  }
}
