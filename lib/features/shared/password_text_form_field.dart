import 'package:flutter/material.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInputField({super.key, required this.controller});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 8) {
          return 'Minimum 8 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
      ),
    );
  }
}
