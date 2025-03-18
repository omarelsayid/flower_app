import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final double screenHeight = MediaQuery.of(context).size.height;
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: Size(
          screenWidth * (screenWidth / 343),
          screenHeight * (screenHeight / 48),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
        ),
      ),
    ),
  );

 
}
