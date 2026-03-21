import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/app/router/app_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';
import 'package:homz/shared/buttons/action_tile.dart';

// TODO: Implement condition builder guest logic

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionTile.profile(title: "Name Placeholder", onTap: () {}),
        const VerticalGap(8),
        ActionTile.normal(
          iconSource: IconSource.svg(kIconNotification),
          title: "Notifications",
          onTap: () {},
        ),
        ActionTile.locale(
          iconSource: IconSource.svg(kIconLocale),
          title: "Language",
          languageCode: "English",
          onTap: () {},
        ),
        ActionTile.normal(
          iconSource: IconSource.svg(kIconPassword),
          title: "Change Password",
          onTap: () {},
        ),
        ActionTile.normal(
          iconSource: IconSource.svg(kIconInfoCircle),
          title: "About",
          onTap: () {},
        ),
        ActionTile.normal(
          iconSource: IconSource.svg(kIconRating),
          title: "Rate Us",
          onTap: () {},
        ),
        ActionTile.normal(
          iconSource: IconSource.svg(kIconShield),
          title: "Legal & Policies",
          onTap: () {},
        ),
        ActionTile.withoutSuffix(
          iconSource: IconSource.svg(kIconLogin),
          title: "Sign Out",
          onTap: () {
            GoRouter.of(context).replace(AppRouter.kViewSignIn);
          },
        ),
      ],
    );
  }
}
