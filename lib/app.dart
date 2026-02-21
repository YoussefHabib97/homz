import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_theme.dart';
import 'package:homz/core/widgets/placeholder_scaffold.dart';
import 'package:homz/features/authentication/sign_in/presentation/pages/sign_in_page.dart';

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: AppTheme.dark,
      home: PlaceholderScaffold(body: SignInPage()),
    );
  }
}
