import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor primarySwatchColor = Colors.green; // Example: Green swatch
  static const Color accentColor = Colors.orange; // Example: Orange accent color
  static const Color textColor = Colors.black87; // Example: Black text color
  static const Color backgroundColor = Colors.white; // Example: White background color

  static const TextStyle headlineTextStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: textColor,
  );

  // Define primaryColor from primarySwatchColor
  static const Color primaryColor = primarySwatchColor; // Use the primary color of primarySwatchColor
}
