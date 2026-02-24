import 'package:flutter/material.dart';
import 'package:homz/core/theme/app_theme.dart';
import 'package:homz/core/widgets/placeholder_scaffold.dart';

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: AppTheme.dark,
      home: PlaceholderScaffold(),
    );
  }
}
