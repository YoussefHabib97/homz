import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_theme.dart';
import 'package:homz/core/utils/app_router.dart';

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      routerConfig: AppRouter.router,
      theme: AppTheme.dark,
    );
  }
}
