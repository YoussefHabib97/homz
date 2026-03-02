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

extension AppTextStyles on BuildContext {
  /// All font sizes are subtracted by 2 for responsive design means
  /// 40 in Figma- Bold
  /// Used for large display titles
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 32 in Figma- Bold
  /// Used for major screen headings
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 24 in Figma- Bold
  /// Used for section headers
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 20 in Figma- Bold
  /// Used for subsection headers
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 18 in Figma- Bold
  /// Used for emphasized titles
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 18 in Figma- Regular
  /// Primary body text
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 16 in Figma- Regular
  /// Secondary body text
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 14 in Figma- Regular
  /// Secondary body text
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 12 in Figma- Regular
  /// Large labels
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  /// All font sizes are subtracted by 2 for responsive design means
  /// 10 in Figma- Regular
  /// Small labels / captions
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;
}
