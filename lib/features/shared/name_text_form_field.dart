import 'package:flutter/material.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      decoration: const InputDecoration(hintText: 'Name'),
    );
  }
}
