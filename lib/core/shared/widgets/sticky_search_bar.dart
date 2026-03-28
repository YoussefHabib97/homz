import 'package:flutter/material.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/widgets/layout/sticky_header_delegate.dart';
import 'package:homz/shared/text_fields/custom_text_form_field.dart';

class StickySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterTap;
  final bool keepSticky;

  const StickySearchBar({
    super.key,
    required this.controller,
    required this.onFilterTap,
    this.keepSticky = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: kPaddingHorizontal,
        vertical: kPaddingVertical,
      ),
      sliver: SliverPersistentHeader(
        pinned: keepSticky,
        delegate: StickyHeaderDelegate(
          height: kToolbarHeight,
          child: CustomTextFormField.search(
            isWithFilter: true,
            controller: controller,
            onFilterTap: onFilterTap,
          ),
        ),
      ),
    );
  }
}
