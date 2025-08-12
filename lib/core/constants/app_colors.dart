import 'package:flutter/material.dart';

abstract class AppColors {
  // Main green color
  static const Color primary = Color(0xFF62b52f);

  // Light Theme Colors
  static const Color scaffoldBackgroundLight = Color(0xFFF0F2F5);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color primaryTextLight = Color(0xFF333333);
  static const Color secondaryTextLight = Color(0xFF666666);

  // Dark Theme Colors
  static const Color scaffoldBackgroundDark = Color(0xFF0D0F21);
  static const Color cardDark = Color(0xFF222643);
  static const Color primaryTextDark = Color(0xFFFFFFFF);
  static const Color secondaryTextDark = Color(0xFFAAAAAA);

  // Common Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}
