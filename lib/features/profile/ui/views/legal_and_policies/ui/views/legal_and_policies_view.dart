import 'package:flutter/material.dart';
import 'package:homz/core/shared/layout/default_app_padding.dart';
import 'package:homz/core/shared/widgets/default_app_bar.dart';

class LegalAndPoliciesView extends StatefulWidget {
  const LegalAndPoliciesView({super.key});

  @override
  State<LegalAndPoliciesView> createState() => _LegalAndPoliciesViewState();
}

class _LegalAndPoliciesViewState extends State<LegalAndPoliciesView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 1);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Text("Legal & Policies")),
      body: DefaultPadding(
        child: Scrollbar(
          trackVisibility: true,
          thumbVisibility: true,
          controller: _scrollController,
          child: SingleChildScrollView(),
        ),
      ),
    );
  }
}
