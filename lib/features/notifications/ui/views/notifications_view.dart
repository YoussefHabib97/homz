import 'package:flutter/material.dart';
import 'package:homz/core/shared/widgets/buttons/action_tile.dart';
import 'package:homz/core/shared/widgets/default_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Text('Notifications')),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => ActionTile.notification(
          title: 'Notification Placeholder',
          onTap: () {},
          onSuffixTap: () {},
        ),
      ),
    );
  }
}
