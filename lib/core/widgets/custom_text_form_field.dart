import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homz/core/constants/constants.dart';
import 'package:homz/core/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textController;
  final bool isPasswordTextFormField;
  final String hintText;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final String? Function(String?) validator;
  final Function(String)? onSubmit;
  final Widget? prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textController,
    required this.validator,
    required this.onSubmit,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.isPasswordTextFormField = false,
    this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isReadOnly, _isFilled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.textInputType,
      obscureText: widget.isPasswordTextFormField,
      keyboardAppearance: Brightness.dark,
      readOnly: _isReadOnly,
      decoration: InputDecoration(
        counterText: "",
        prefixIcon: widget.isPasswordTextFormField
            ? SvgPicture.asset(
                kPasswordIcon,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  AppColors.grey[400]!,
                  BlendMode.srcATop,
                ),
              )
            : widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.grey[400]!),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: !_isFilled ? AppColors.grey[600]! : AppColors.grey[400]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey[200]!, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppAlertColors.error),
        ),
      ),
      maxLength: 50,
      onChanged: (value) {
        widget.textController.text = value;
        widget.textController.text.isNotEmpty
            ? setState(() {
                _isFilled = true;
              })
            : setState(() {
                _isFilled = false;
              });
      },
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmit,
    );
  }

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _isReadOnly = false;
    _isFilled = false;
    super.initState();
  }
}
