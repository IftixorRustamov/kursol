import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color secondary = Color(0xFFFFD300);
  static const primary = _PrimaryBlue();
  static const greyScale = _GreyScale();

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Color(0xFFF44336);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);

  //indicator
  static const Color progressLow = Color(0xFFE57373);
  static const Color progressMediumLow = Color(0xFFFFB74D);
  static const Color progressMediumHigh = Color(0xFFFFD54F);
  static const Color progressHigh = Color(0xFF81C784);
  static const Color progressComplete = Color(0xFF4CAF50);
  
  // Background Colors
  static const Color backgroundBlue = Color(0xFFF6FAFD);
  static const Color backgroundGreen = Color(0xFFF2FFFC);
  static const Color backgroundOrange = Color(0xFFFFFBED);
  static const Color backgroundPink = Color(0xFFFFF5F5);
  static const Color backgroundYellow = Color(0xFFFFFEE0);
  static const Color backgroundPurple = Color(0xFFFCF4FF);
  
    // Dark Colors
  static const Color dark1 = Color(0xFF181A20);
  static const Color dark2 = Color(0xFF1F222A);
  static const Color dark3 = Color(0xFF35383F);
  
   // Transparent Colors
  static const Color transparentBlue = Color(0x33335EF7);
  static const Color transparentOrange = Color(0x33FF9800);
  static const Color transparentYellow = Color(0x33FACC15);
  static const Color transparentRed = Color(0x33F75555);
  static const Color transparentGreen = Color(0x334CAF50);
  static const Color transparentPurple = Color(0x339C27B0);
  static const Color transparentCyan = Color(0x3300BCD4);
  
    // **Card Background Colors**
  static const Color lightCardBackground = Color(0xFFF6FAFD); // Light Mode
  static const Color darkCardBackground = Color(0xFF181A20); // Dark Mode
}

class _PrimaryBlue {
  const _PrimaryBlue();

  final blue100 = const Color(0xFFEBEFFE);
  final blue200 = const Color(0xFFADBFFC);
  final blue300 = const Color(0xFF859EFA);
  final blue400 = const Color(0xFF5C7EF9);
  final blue500 = const Color(0xFF335EF7);

  Color call() => blue500;
}

class _GreyScale {
  const _GreyScale();

  final Color grey900 = const Color(0xFF212121);
  final Color grey800 = const Color(0xFF424242);
  final Color grey700 = const Color(0xFF616161);
  final Color grey600 = const Color(0xFF757575);
  final Color grey500 = const Color(0xFF9E9E9E);
  final Color grey400 = const Color(0xFFBDBDBD);
  final Color grey300 = const Color(0xFFE0E0E0);
  final Color grey200 = const Color(0xFFEEEEEE);
  final Color grey100 = const Color(0xFFF5F5F5);
  final Color grey50 = const Color(0xFFFAFAFA);

  Color call() => grey500;
}
