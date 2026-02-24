import 'package:flutter/material.dart';

class CustomSignInAppBar extends StatelessWidget {
  const CustomSignInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Color(0xFFEFC3C3)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
