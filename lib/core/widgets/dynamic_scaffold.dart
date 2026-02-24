//? TODO: Check if this widget is necessary

import 'package:flutter/material.dart';

class DynamicScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  const DynamicScaffold({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
    );
  }
}
