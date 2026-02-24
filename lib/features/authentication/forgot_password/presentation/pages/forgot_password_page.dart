import "package:flutter/material.dart";
import "package:homz/core/widgets/custom_button.dart";
import "package:homz/core/widgets/custom_form.dart";
import "package:homz/core/widgets/custom_text_form_field.dart";
import "package:homz/core/widgets/dynamic_scaffold.dart";

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DynamicScaffold(
      appBar: AppBar(centerTitle: true, title: Text("Forgot Password")),
      body: CustomForm(
        child: Column(
          spacing: 32,
          children: [
            Text(
              "Enter your mobile number to reset your password",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CustomTextFormField(
              hintText: "Mobile Number",
              textInputType: TextInputType.numberWithOptions(),
              textController: _textEditingController,
              validator: (value) {
                return null;
              },
              onSubmit: (value) {},
            ),
            CustomButton(text: "Send Code", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }
}
