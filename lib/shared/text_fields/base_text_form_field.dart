import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;

  const BaseTextFormField({
    super.key,
    required this.controller,
    required this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.validator,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction:
          textInputAction ??
          (validator != null ? TextInputAction.next : TextInputAction.done),
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: decoration,
      // Auto-dismiss keyboard when tapping away
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
