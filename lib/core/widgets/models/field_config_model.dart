import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';

enum FieldType { name, password, confirmPassword, phone, search, chat }

class FieldConfig {
  final String hint;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefix;

  const FieldConfig({
    required this.hint,
    required this.keyboardType,
    this.validator,
    this.prefix,
  });

  static FieldConfig get(
    FieldType type, {
    TextEditingController? passwordToMatch,
  }) {
    switch (type) {
      case FieldType.name:
        return FieldConfig(
          hint: 'Name',
          keyboardType: TextInputType.name,
          validator: (val) =>
              (val ?? '').trim().isEmpty ? 'Name is required' : null,
        );
      case FieldType.password:
        return FieldConfig(
          hint: 'Password',
          keyboardType: TextInputType.visiblePassword,
          validator: (val) =>
              (val ?? '').length < 8 ? 'Minimum 8 characters' : null,
          prefix: SvgPicture.asset(kIconPassword, fit: BoxFit.scaleDown),
        );
      case FieldType.confirmPassword:
        return FieldConfig(
          hint: 'Confirm Password',
          keyboardType: TextInputType.visiblePassword,
          validator: (val) {
            if ((val ?? '').isEmpty) return 'Confirm your password';
            if (val != passwordToMatch?.text) return 'Passwords do not match';
            return null;
          },
          prefix: SvgPicture.asset(kIconPassword, fit: BoxFit.scaleDown),
        );
      case FieldType.phone:
        return const FieldConfig(
          hint: 'Phone Number',
          keyboardType: TextInputType.phone,
        );
      case FieldType.search:
        return const FieldConfig(
          hint: 'Search...',
          keyboardType: TextInputType.text,
        );
      case FieldType.chat:
        return const FieldConfig(
          hint: 'Type a message...',
          keyboardType: TextInputType.multiline,
        );
    }
  }
}
