import 'package:flower_app/core/services/screen_size_service.dart';
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
          (343 / ScreenSizeService.baseWidth) * screenWidth,
          (48 / ScreenSizeService.baseHeight) * screenHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
        ),
      ),
    ),
  );
}

OutlineInputBorder textFiledInputBorder() {
  final screenWidth = ScreenSizeService.width;

  double responsiveRadius = (4 / 375.0) * screenWidth;
  double responsiveBorderWidth = (1 / 375.0) * screenWidth;

  return OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(responsiveRadius),
      topRight: Radius.circular(responsiveRadius),
    ),
    borderSide: BorderSide(color: Colors.grey, width: responsiveBorderWidth),
  );
}
