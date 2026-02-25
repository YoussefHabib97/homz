import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;

  const BaseTextFormField({
    super.key,
    required this.controller,
    required this.decoration,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      decoration: decoration,
    );
  }
}
