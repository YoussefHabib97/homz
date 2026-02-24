import 'package:flutter/material.dart';
import 'package:homz/features/authentication/sign_in/presentation/pages/sign_in_page.dart';

class PlaceholderScaffold extends StatelessWidget {
  const PlaceholderScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome to\nHomz",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFEFC3C3)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              "(عربي)",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Color(0xFFEFC3C3)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SignInPage(),
            ],
          ),
        ),
      ),
    );
  }
}
