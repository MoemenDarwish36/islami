import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  /// light
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.accentLight,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.accentLight,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: AppColors.accentLight,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.accentLight,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentLight));
}
