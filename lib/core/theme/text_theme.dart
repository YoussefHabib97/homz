import 'package:flutter/material.dart';

TextTheme buildTextTheme() {
  return const TextTheme(
    displaySmall: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    labelLarge: TextStyle(fontSize: 12),
    labelSmall: TextStyle(fontSize: 10),
  ).apply(fontFamily: 'SpaceGrotesk');
}
