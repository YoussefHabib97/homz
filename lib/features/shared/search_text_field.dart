import 'package:flutter/material.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onFilterTap;

  const SearchInputField({
    super.key,
    required this.controller,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: onFilterTap != null
            ? IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: onFilterTap,
              )
            : null,
      ),
    );
  }
}
