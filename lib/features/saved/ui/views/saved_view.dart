import 'package:flutter/material.dart';
import 'package:homz/app/navigation/unpopulated_nav_tab.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';
import 'package:homz/core/widgets/shared/sticky_search_bar.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        StickySearchBar(
          controller: TextEditingController(),
          onFilterTap: () {},
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: AppDefaultPadding(
            child: Center(
              child: UnpopulatedNavTabBody(
                imagePath: kImageSearchIllustration,
                title: "Nothing here!",
                subtitle: "You don't have any places saved yet",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
