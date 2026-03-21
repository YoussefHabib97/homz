import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/layout/sticky_header_delegate.dart';
import 'package:homz/shared/text_fields/custom_text_form_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
            vertical: kPaddingVertical,
          ),
          sliver: SliverPersistentHeader(
            pinned: true,
            delegate: StickyHeaderDelegate(
              height: kToolbarHeight,
              child: CustomTextFormField.search(
                controller: TextEditingController(),
                onFilterTap: () {},
              ),
            ),
          ),
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
