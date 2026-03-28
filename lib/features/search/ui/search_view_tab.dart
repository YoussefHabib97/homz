import 'package:flutter/material.dart';
import 'package:homz/core/widgets/shared/sticky_search_bar.dart';
import 'package:homz/shared/buttons/action_tile.dart';

class SearchViewTab extends StatelessWidget {
  const SearchViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        StickySearchBar(
          controller: TextEditingController(),
          onFilterTap: () {},
        ),
        // TODO: Implement condition builder
        SliverList.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ActionTile.search(
              onTap: () {},
              onSuffixTap: () {},
              title: "Search result ${index + 1}",
            );
          },
        ),
        // SliverFillRemaining(
        //   hasScrollBody: false,
        //   child: AppDefaultPadding(
        //     child: Center(
        //       child: UnpopulatedNavTabBody(
        //         imagePath: kImageSearchIllustration,
        //         title: "No results found",
        //         subtitle: "Please try again",
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
