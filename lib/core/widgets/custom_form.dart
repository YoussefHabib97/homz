import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Widget child;
  const CustomForm({super.key, required this.child});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteractionIfError,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: widget.child,
      ),
    );
  }
}
