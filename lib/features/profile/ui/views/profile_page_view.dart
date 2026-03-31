import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/widgets/buttons/action_tile.dart';
import 'package:homz/core/utils/app_router.dart';

// TODO: Implement condition builder guest logic

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionTile.profile(
          title: "Name Placeholder",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kViewAccountDetails);
          },
        ),
        const Gap(8),
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
          onTap: () {
            GoRouter.of(context).push(AppRouter.kViewLegalAndPolicies);
          },
        ),
        ActionTile.withoutSuffix(
          iconSource: IconSource.svg(kIconLogin),
          title: "Sign Out",
          onTap: () {
            GoRouter.of(context).go(AppRouter.kViewSignIn);
          },
        ),
      ],
    );
  }
}
