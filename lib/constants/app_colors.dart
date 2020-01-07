import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 31, 229, 146);


/// Most color assignments in Rally are not like the the typical color
/// assignments that are common in other apps. Instead of primarily mapping to
/// component type and part, they are assigned round robin based on layout.
class RallyColors {
  static const accountColors = [
    Color(0xFF005D57),
    Color(0xFF04B97F),
    Color(0xFF37EFBA),
    Color(0xFF007D51),
  ];

  static const billColors = [
    Color(0xFFFFDC78),
    Color(0xFFFF6951),
    Color(0xFFFFD7D0),
    Color(0xFFFFAC12),
  ];

  static const budgetColors = [
    Color(0xFFB2F2FF),
    Color(0xFFB15DFF),
    Color(0xFF72DEFF),
    Color(0xFF0082FB),
  ];

  static const gray = Color(0xFFD8D8D8);
  static const gray60 = Color(0x99D8D8D8);
  static const gray25 = Color(0x40D8D8D8);
  static const white60 = Color(0x99FFFFFF);
  static const primaryBackground = Color(0xFF33333D);
  static const inputBackground = Color(0xFF26282F);
  static const cardBackground = Color(0x03FEFEFE);

  /// Convenience method to get a single account color with position i.
  static Color accountColor(int i) {
    return cycledColor(accountColors, i);
  }

  /// Convenience method to get a single bill color with position i.
  static Color billColor(int i) {
    return cycledColor(billColors, i);
  }

  /// Convenience method to get a single budget color with position i.
  static Color budgetColor(int i) {
    return cycledColor(budgetColors, i);
  }

  /// Gets a color from a list that is considered to be infinitely repeating.
  static Color cycledColor(List<Color> colors, int i) {
    return colors[i % colors.length];
  }
}