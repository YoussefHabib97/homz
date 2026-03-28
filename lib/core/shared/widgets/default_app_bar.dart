import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final bool centerTitle;
  final double toolbarHeight;
  final Color? backgroundColor;
  const DefaultAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.actions = const [],
    this.centerTitle = true,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
