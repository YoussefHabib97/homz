import 'package:flutter/material.dart';
import 'package:homz/theme/app_theme.dart';
import 'package:homz/widgets/custom_form.dart';

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
    return Scaffold(body: SafeArea(child: CustomForm()));
  }
}
