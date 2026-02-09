import 'package:flutter/material.dart';
import 'package:homz/theme/app_colors.dart';
import 'package:homz/theme/app_theme.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorScales.grey[600]!,
                        width: 1,
                      ),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: ColorScales.grey[50]!,
                    //     width: 2,
                    //   ),
                    // ),
                    // errorBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: AppAlertColors.error,
                    //     width: 2,
                    //   ),
                    // ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
