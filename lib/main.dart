import 'package:flutter/material.dart';
import 'package:homz/theme/app_theme.dart';
import 'package:homz/widgets/custom_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homz',
      theme: buildAppTheme(),
      home: TestingWidget(),
    );
  }
}

class TestingWidget extends StatelessWidget {
  const TestingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: TestForm()));
  }
}

class TestForm extends StatefulWidget {
  const TestForm({super.key});

  @override
  State<TestForm> createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = false;
  bool _isReadOnly = false;

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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.dark,
                readOnly: _isReadOnly,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomButton(
                      text: 'Submit',
                      onPressed: _isButtonDisabled
                          ? null
                          : () {
                              setState(() {
                                _isButtonDisabled = true;
                                _isReadOnly = true;
                              });
                            },
                      isPrimary: false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
