import 'package:flutter/material.dart';
import 'package:homz/app/navigation/unpopulated_nav_tab.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/layout/default_app_padding.dart';
import 'package:homz/core/shared/widgets/sticky_search_bar.dart';

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
          child: DefaultPadding(
            child: Center(
              child: UnpopulatedNavTabBody(
                imagePath: kImageSavedIllustration,
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
