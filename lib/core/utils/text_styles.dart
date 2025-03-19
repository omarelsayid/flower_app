import 'package:flower_app/core/utils/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flower_app/main.dart';

class AppTextStyles {
  static double _responsiveFontSize(double baseSize) {
    final screenWidth = navigatorKey.currentContext!.size!.width;
    return (baseSize / baseWidth) *
        screenWidth; 
  }

  static TextStyle get inter500_20 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(20),
  );

  static TextStyle get inter400_14 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(14),
  );

  static TextStyle get inter400_12 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(12),
  );

  static TextStyle get inter500_16 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(16),
  );

  static TextStyle get inter600_12 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: _responsiveFontSize(12),
  );

  static TextStyle get inter500_18 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(18),
  );

  // Roboto Fonts
  static TextStyle get roboto400_12 => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(12),
  );

  static TextStyle get roboto400_14 => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(14),
  );

  static TextStyle get roboto500_16 => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(16),
  );

  static TextStyle get roboto400_18 => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(18),
  );

  static TextStyle get roboto500_18 => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(18),
  );
}
