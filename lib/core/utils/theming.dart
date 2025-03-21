import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/text_styles.dart';
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

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: AppTextStyles.roboto400_14.copyWith(color: Color(0xffA6A6A6)),
      labelStyle: AppTextStyles.roboto400_12.copyWith(color: Color(0xff535353)),
      contentPadding: EdgeInsets.fromLTRB(
        (16 / ScreenSizeService.baseWidth) * screenWidth,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
        0,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
      ),
      focusedBorder: textFiledInputBorder(),
      enabledBorder: textFiledInputBorder(),
      border: textFiledInputBorder(),
      filled: true,
      fillColor: Colors.transparent,
      errorMaxLines: 2,
      errorStyle: AppTextStyles.roboto400_12.copyWith(color: Colors.red),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: AppTextStyles.inter500_16.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: primaryColor,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(primaryColor),
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
