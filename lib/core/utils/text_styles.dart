import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle inter500_20(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, 20),
    );
  }

  static TextStyle inter400_14(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, 14),
    );
  }

  static TextStyle inter400_12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, 12),
    );
  }

  static TextStyle inter500_16(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, 16),
    );
  }

  static TextStyle inter600_12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context, 12),
    );
  }

  static TextStyle inter500_18(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, 18),
    );
  }

  // Roboto Fonts
  static TextStyle roboto400_12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, 12),
    );
  }

  static TextStyle roboto400_14(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, 14),
    );
  }

  static TextStyle roboto500_16(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, 16),
    );
  }

  static TextStyle roboto400_18(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, 18),
    );
  }

  static TextStyle roboto500_18(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, 18),
    );
  }

  // Function to get responsive font size
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 375; // 375 is the reference width (e.g., iPhone X)
    return baseSize * scaleFactor;
  }
}
