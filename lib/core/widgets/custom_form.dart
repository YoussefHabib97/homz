import 'package:flutter/material.dart';
import 'package:homz/core/extensions/extensions.dart' show ExtString;
import 'package:homz/core/widgets/custom_button.dart';
import 'package:homz/core/widgets/custom_text_form_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = false;
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  hintText: 'Email Address',
                  textController: textController,
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        value.isValidEmail) {
                      return null;
                    } else {
                      return 'Please enter a valid email address';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      textController.text = value.trim();
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            //? TODO: Async logic
                            setState(() {
                              _isButtonDisabled = true;
                            });
                          }
                        },
                  text: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
