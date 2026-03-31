import 'package:flutter/material.dart';
import 'package:homz/features/search/ui/search_view_tab.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: SearchFilterSheet())),
    );
  }
}
