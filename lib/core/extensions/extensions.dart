import 'package:flutter/material.dart';

extension StringExtension on String {
  bool get isValidName {
    final nameRegExp = RegExp(
      r"^[a-zA-Z\p{L} ,.'-]*$",
      caseSensitive: false,
      unicode: true,
    );
    return nameRegExp.hasMatch(this);
  }

  String capitalizeEach() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map(
          (element) =>
              "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}",
        )
        .join(" ");
  }
}

/// All font sizes are subtracted by 2 for responsive design means
extension AppTextStyles on BuildContext {
  /// 40 in Figma - Bold
  /// Used for large display titles
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  /// 32 in Figma - Bold
  /// Used for major screen headings
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  /// 24 in Figma - Bold
  /// Used for section headers
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  /// 20 in Figma - Bold
  /// Used for subsection headers
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  /// 18 in Figma - Bold
  /// Used for emphasized titles
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  /// 18 in Figma - Regular
  /// Primary body text
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  /// 16 in Figma - Regular
  /// Secondary body text
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  /// 14 in Figma - Regular
  /// Secondary body text
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  /// 12 in Figma - Regular
  /// Large labels
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  /// 10 in Figma - Regular
  /// Small labels / captions
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
}
