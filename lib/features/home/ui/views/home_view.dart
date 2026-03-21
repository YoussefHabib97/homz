import 'package:flutter/material.dart';
import 'package:homz/app/navigation/app_shell.dart';
import 'package:homz/features/home/ui/widgets/navigation_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = NavTabs.build(context);
    return AppShell(tabs: tabs);
  }
}
