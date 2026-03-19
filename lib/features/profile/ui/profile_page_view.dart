import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/utils/app_router.dart';
import 'package:homz/core/widgets/shared/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/buttons/profile_redirect_button.dart';

//? TODO: Implement condition builder guest logic

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileRedirectButton.profile(title: "Name Placeholder", onTap: () {}),
        const VerticalGap(8),
        ProfileRedirectButton.normal(
          iconSource: IconSource.svg(kIconNotification),
          title: "Notifications",
          onTap: () {},
        ),
        ProfileRedirectButton.locale(
          iconSource: IconSource.svg(kIconLocale),
          title: "Language",
          languageCode: "English",
          onTap: () {},
        ),
        ProfileRedirectButton.normal(
          iconSource: IconSource.svg(kIconPassword),
          title: "Change Password",
          onTap: () {},
        ),
        ProfileRedirectButton.normal(
          iconSource: IconSource.svg(kIconInfoCircle),
          title: "About",
          onTap: () {},
        ),
        ProfileRedirectButton.normal(
          iconSource: IconSource.svg(kIconRating),
          title: "Rate Us",
          onTap: () {},
        ),
        ProfileRedirectButton.normal(
          iconSource: IconSource.svg(kIconShield),
          title: "Legal & Policies",
          onTap: () {},
        ),
        ProfileRedirectButton.withoutSuffix(
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
