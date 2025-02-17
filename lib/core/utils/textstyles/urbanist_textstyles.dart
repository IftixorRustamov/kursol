import 'app_textstyles.dart';
import 'package:flutter/material.dart';

class UrbanistTextStyles extends AppTextStyles {
  static const String font = 'Urbanist';

  @override
  TextStyle bold({required Color color, required double fontSize}) => TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: font,
  );

  @override
  TextStyle semiBold({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      );

  @override
  TextStyle medium({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: font,
      );

  @override
  TextStyle regular({required Color color, required double fontSize}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      );
}
