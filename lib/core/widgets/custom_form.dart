import 'package:flutter/material.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: widget.child,
        ),
      ),
    );
  }
}
