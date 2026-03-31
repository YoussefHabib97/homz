import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/shared/widgets/buttons/action_tile.dart';
import 'package:homz/core/shared/widgets/buttons/rounded_button.dart';
import 'package:homz/core/shared/widgets/sticky_search_bar.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/features/home/ui/widgets/buttons/rent_buy_button.dart';

class SearchViewTab extends StatefulWidget {
  const SearchViewTab({super.key});

  @override
  State<SearchViewTab> createState() => _SearchViewTabState();
}

class _SearchViewTabState extends State<SearchViewTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        StickySearchBar(
          controller: TextEditingController(),
          onFilterTap: () {
            showModalBottomSheet(
              constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
              ),
              context: context,
              builder: (context) => SearchFilterSheet(),
            );
          },
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

class SearchFilterSheet extends StatelessWidget {
  const SearchFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        spacing: 16,
        children: [
          RentBuyButton(),
          Card(
            color: AppColors.grey[700],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    SvgPicture.asset(kIconBath),
                    Text("Property Type"),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) => Gap(16),
                    itemBuilder: (context, index) => RoundedButton.icon(
                      backgroundColor: AppColors.grey[500]!,
                      iconPath: kIconApple,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
