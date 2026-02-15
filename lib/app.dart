import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_theme.dart';
import 'package:homz/features/onboarding/presentation/pages/onboarding_page.dart';

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: OnboardingPage(),
    );
  }
}
