import 'package:flower_app/core/services/screen_size_service.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static double _responsiveFontSize(double baseSize) {
    final screenWidth = ScreenSizeService.width;
    return (baseSize / ScreenSizeService.baseWidth) * screenWidth;
  }

  static TextStyle get inter500_20 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(20),
  );
  static TextStyle get inter500_14 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(14),
  );
  static TextStyle get inter500_13 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(13),
  );

  static TextStyle get inter400_14 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(14),
  ); static TextStyle get inter400_16 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(16),
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
  static TextStyle get inter600_18 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: _responsiveFontSize(18),
  );
  static TextStyle get inter700_20 => TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: _responsiveFontSize(20),
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
  );  static TextStyle get roboto400_16 => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: _responsiveFontSize(16),
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
  static TextStyle get outfit700_20 => TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w700,
    fontSize: _responsiveFontSize(20),
    height: 1.2, // 120%
    letterSpacing: 0.3,
  );
  static TextStyle get outfitMedium_16 => TextStyle(
    fontFamily: 'Outfit',
    fontWeight: FontWeight.w500,
    fontSize: _responsiveFontSize(16),
    height: 1.2, // 120%
    letterSpacing: 0.3,
  );
}
