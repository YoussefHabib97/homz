import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onSubmit;
  final Widget? prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onSubmit,
    this.isPassword = false,
    this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null,
      ),
    );
  }

  @override
  void initState() {
    _obscure = widget.isPassword;
    super.initState();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:homz/core/constants/constants.dart';
// import 'package:homz/core/theme/app_colors.dart';

// class CustomTextFormField extends StatefulWidget {
//   final TextEditingController textController;
//   final bool isPassword, isMobile;
//   final String hintText;
//   final TextInputType textInputType;
//   final TextCapitalization textCapitalization;
//   final String? Function(String?) validator;
//   final Function(String)? onSubmit;
//   final Widget? prefixIcon;

//   const CustomTextFormField({
//     super.key,
//     required this.hintText,
//     required this.textController,
//     required this.validator,
//     required this.onSubmit,
//     this.textCapitalization = TextCapitalization.none,
//     this.textInputType = TextInputType.text,
//     this.isMobile = false,
//     this.isPassword = false,
//     this.prefixIcon,
//   });

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// enum TextFormFieldType { mobileNumber, password, text }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late bool _isReadOnly, _isFilled;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.textController,
//       textCapitalization: widget.textCapitalization,
//       keyboardType: widget.textInputType,
//       obscureText: widget.isPassword,
//       keyboardAppearance: Brightness.dark,
//       readOnly: _isReadOnly,
//       decoration: InputDecoration(
//         counterText: "",
//         prefixIcon: widget.isPassword
//             ? SvgPicture.asset(
//                 kPasswordIcon,
//                 fit: BoxFit.scaleDown,
//                 colorFilter: ColorFilter.mode(
//                   AppColors.grey[400]!,
//                   BlendMode.srcATop,
//                 ),
//               )
//             : widget.prefixIcon,
//         hintText: widget.hintText,
//         hintStyle: TextStyle(color: AppColors.grey[400]!),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: !_isFilled ? AppColors.grey[600]! : AppColors.grey[400]!,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey[200]!, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppAlertColors.error),
//         ),
//       ),
//       maxLength: 50,
//       onChanged: (value) {
//         setState(() {
//           _isFilled = value.isNotEmpty;
//         });
//       },
//       validator: widget.validator,
//       onFieldSubmitted: widget.onSubmit,
//     );
//   }

//   TextFormField buildTextFormField() {
//     return TextFormField();
//   }

//   @override
//   void initState() {
//     _isReadOnly = false;
//     _isFilled = false;
//     super.initState();
//   }
// }
