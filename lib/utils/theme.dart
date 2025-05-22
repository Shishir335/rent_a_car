import 'package:flutter/material.dart';
import 'package:rent_a_car/utils/colors.dart';

var theme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.secondaryColor,
  primaryColorDark: AppColors.black,
  splashColor: const Color(0xFFCCEAF5),
  scaffoldBackgroundColor: Colors.grey.shade100,
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.white),
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.white,
  ),
  secondaryHeaderColor: const Color(0xffff9800),
  iconTheme: const IconThemeData(color: AppColors.black),
  cardColor: Colors.white,
  hintColor: Colors.grey.shade400,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xFF009CBB),
    selectionColor: Color(0xFF009CBB),
    selectionHandleColor: Color(0xFF009CBB),
  ),
  canvasColor: Colors.white,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: AppColors.black, fontSize: 12),
    bodyMedium: TextStyle(color: AppColors.black, fontSize: 14),
    bodyLarge: TextStyle(color: AppColors.black, fontSize: 16),
    //
    titleSmall: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleLarge: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    //
    labelSmall: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    //
    headlineSmall: TextStyle(color: AppColors.black, fontSize: 20),
    headlineMedium: TextStyle(color: AppColors.black, fontSize: 22),
    headlineLarge: TextStyle(color: AppColors.black, fontSize: 24),
  ),
);
