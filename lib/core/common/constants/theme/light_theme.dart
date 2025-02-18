import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.white),
  ),
  // iconTheme: const IconThemeData(color: AppColors.grey),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.black),
    // bodyMedium: TextStyle(color: AppColors.lightGrey),
    // titleMedium: TextStyle(color: AppColors.lightGrey),
    titleLarge: TextStyle(color: AppColors.black),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary(),
    onPrimary: Colors.white70,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.white,
  ),
);
