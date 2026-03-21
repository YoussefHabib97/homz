import 'package:flutter/material.dart';
import 'package:homz/core/widgets/layout/app_padding_and_gaps.dart';

class CustomForm extends StatefulWidget {
  final Widget child;
  final GlobalKey<FormState> formKey;
  const CustomForm({super.key, required this.child, required this.formKey});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteractionIfError,
        child: AppDefaultPadding(
          horizontalOffset: 0,
          verticalOffset: 12,
          child: widget.child,
        ),
      ),
    );
  }
}
