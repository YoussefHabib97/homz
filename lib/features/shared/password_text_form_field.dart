import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextFormField({super.key, required this.controller});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscure = true;
  late FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    // ? TODO: Research MaterialState, ValueListenableBuilder and FocusNode alongside theming for inputs for more potential refactoring
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (_, value, _) {
        final hasText = value.text.isNotEmpty;
        final isFocused = _focusNode.hasFocus;

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
            prefixIcon: SvgPicture.asset(
              kPasswordIcon,
              fit: BoxFit.scaleDown,
              colorFilter: _resolveIconColor(
                context,
                hasText: hasText,
                isFocused: isFocused,
              ),
            ),
            suffixIcon: hasText
                ? IconButton(
                    icon: SvgPicture.asset(
                      _obscure ? kEyeIcon : kEyeSlashIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: _resolveIconColor(
                        context,
                        hasText: hasText,
                        isFocused: isFocused,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  )
                : null,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  // ? TODO: Implement as a helper function to affect all InputFields
  ColorFilter _resolveIconColor(
    BuildContext context, {
    required bool hasText,
    required bool isFocused,
  }) {
    if (isFocused) {
      return ColorFilter.mode(AppColors.grey[50]!, BlendMode.srcATop);
    }

    if (hasText) {
      return ColorFilter.mode(AppColors.grey[200]!, BlendMode.srcATop);
    }

    return ColorFilter.mode(AppColors.grey[400]!, BlendMode.srcATop);
  }
}
