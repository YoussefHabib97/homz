import 'package:flutter/material.dart';

class PlaceholderScaffold extends StatelessWidget {
  final Widget body;
  const PlaceholderScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 128,
        title: Text(
          "Welcome to\nHomz",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [],
      ),
      body: body,
    );
  }
}
